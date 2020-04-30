// includes for files
#include <fs/fs.h>
#include <fs/littlefs.h>
#include <storage/flash_map.h>
#include <stdio.h>

#define MAX_PATH_LEN 255

extern struct fs_mount_t *mp;
extern struct fs_file_t encounter_file;
extern bool flash_full;
extern bool write_flash;

void flash_close();

int flash_init(void) {
    unsigned int id = (uintptr_t)mp->storage_dev;
    const struct flash_area *pfa;
    int rc;
    char fname[MAX_PATH_LEN];
    struct fs_statvfs sbuf;

    rc = flash_area_open(id, &pfa);
    if (rc < 0) {
        printk("FAIL: unable to find flash area %u: %d\n",
               id, rc);
        //  Need to add LED blink here to indicate error

        return -1;
    }
    // Print info about flash area
    printk("\nArea %u at 0x%x on %s for %u bytes\n\n",
           id, (unsigned int)pfa->fa_off, pfa->fa_dev_name,
           (unsigned int)pfa->fa_size);

    /* Optional wipe flash contents */
    if (IS_ENABLED(CONFIG_APP_WIPE_STORAGE)) {
        printk("Erasing flash area ... ");
        rc = flash_area_erase(pfa, 0, pfa->fa_size);
        printk("%d\n", rc);
        flash_area_close(pfa);
    }

    rc = fs_mount(mp);
    if (rc < 0) {
        printk("FAIL: mount id %u at %s: %d\n",
               (unsigned int)mp->storage_dev, mp->mnt_point,
               rc);
        return -2;
    }
    printk("%s mount: %d\n", mp->mnt_point, rc);

    
    // Stats about the mountpoint
    rc = fs_statvfs(mp->mnt_point, &sbuf);
    if (rc < 0) {
        printk("FAIL: statvfs: %d\n", rc);
        flash_close();
        return -4;
        // goto out;
    }

    printk("%s: bsize = %lu ; frsize = %lu ;"
           " blocks = %lu ; bfree = %lu\n",
           mp->mnt_point,
           sbuf.f_bsize, sbuf.f_frsize,
           sbuf.f_blocks, sbuf.f_bfree);
    

    struct fs_file_t file;
    struct fs_dirent dirent;

    snprintf(fname, sizeof(fname), "%s/encounters", mp->mnt_point);
    // fetch file info

    rc = fs_stat(fname, &dirent);
    printk("%s stat: %d\n", fname, rc);
    if (rc >= 0) {
        printk("\tfn '%s' siz %u\n", dirent.name, dirent.size);
    }
    // try to open encounter file
    rc = fs_open(&encounter_file, fname);
    if (rc < 0) {
        printk("FAIL: open %s: %d\n", fname, rc);
        flash_close();
        return -3;
        // goto out;
    } else { 
        // jump to end of the file to start writing
        rc = fs_seek(&encounter_file, 0, FS_SEEK_END);
        printk("Jump to end, rc: %d\n", rc);
        printk("address: %x\n",(unsigned int) &encounter_file);
    }

    snprintf(fname, sizeof(fname), "%s/boot_count", mp->mnt_point);
    // Fetch file info
    rc = fs_stat(fname, &dirent);
    printk("%s stat: %d\n", fname, rc);
    if (rc >= 0) {
        printk("\tfn '%s' siz %u\n", dirent.name, dirent.size);
    }


    rc = fs_open(&file, fname);
    if (rc < 0) {
        printk("FAIL: open %s: %d\n", fname, rc);
        return -3;
        // goto out;
    }

    u32_t boot_count = 0;

    if (rc >= 0) {
        rc = fs_read(&file, &boot_count, sizeof(boot_count));
        printk("%s read count %u: %d\n", fname, boot_count, rc);
        rc = fs_seek(&file, 0, FS_SEEK_SET);
        printk("%s seek start: %d\n", fname, rc);

    }

    boot_count += 1;
    rc = fs_write(&file, &boot_count, sizeof(boot_count));
    printk("%s write new boot count %u: %d\n", fname,
           boot_count, rc);

    rc = fs_close(&file);
    printk("%s close: %d\n", fname, rc);

    return 0;
}

void ls(void) {
    struct fs_dir_t dir = { 0 };
    int rc;

    rc = fs_opendir(&dir, mp->mnt_point);
    printk("%s opendir: %d\n", mp->mnt_point, rc);

    while (rc >= 0) {
        struct fs_dirent ent = { 0 };

        rc = fs_readdir(&dir, &ent);
        if (rc < 0) {
            break;
        }
        if (ent.name[0] == 0) {
            printk("End of files\n");
            break;
        }
        printk("  %c %u %s\n",
               (ent.type == FS_DIR_ENTRY_FILE) ? 'F' : 'D',
               ent.size,
               ent.name);
    }

    (void)fs_closedir(&dir);
}

void encounter_info(void) {
    struct fs_dirent dirent;
    char fname[MAX_PATH_LEN];
    int rc;

    snprintf(fname, sizeof(fname), "%s/encounters", mp->mnt_point);
    // fetch file info

    rc = fs_stat(fname, &dirent);
    printk("%s stat: %d\n", fname, rc);
    if (rc >= 0) {
        printk("\tfn '%s' siz %u\n", dirent.name, dirent.size);
    }
}


void flash_close(void) {
    int rc;
    rc = fs_unmount(mp);
    printk("%s unmount: %d\n", mp->mnt_point, rc);
}

 
