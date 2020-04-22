/******************************************************/
//       THIS IS A GENERATED FILE - DO NOT EDIT       //
/******************************************************/

#include "Particle.h"
#line 1 "/Users/nams/Documents/projects/covid/adafruit/ble_adv_covid/particle/littlefs_test/src/littlefs_test.ino"
/*
 * Project littlefs_test
 * Description:
 * Author:
 * Date:
 */

//#include "Particle.h"
//#include "dynalib.h"
#include "filesys.h"

void fs_print_dir(lfs_dir_t *d, const char *path, int level);
void fs_print_tree();
void setup();
void loop();
#line 12 "/Users/nams/Documents/projects/covid/adafruit/ble_adv_covid/particle/littlefs_test/src/littlefs_test.ino"
void fs_print_dir(lfs_dir_t *d, const char *path, int level) {
    while (true) {
        lfs_info info;
        int err = dir_read(d, &info);
        if (err == 0) return;
        if (err < 0) {
            Log.warn("dir_read->%d", err);
            return;
        }
        if (strcmp(info.name, ".") == 0 || strcmp(info.name, "..") == 0) continue;
        for (int i=0; i<level; i++) Serial.print("  ");
        Serial.printf("%s (%d)\n", info.name, info.size);
        if (info.type == LFS_TYPE_DIR) {
            char child[strlen(path)+strlen(info.name)+2];
            sprintf(child, "%s/%s", path, info.name);
            lfs_dir_t c;
            err = dir_open(&c, child);
            if (err != 0) {
                Log.warn("dir_open(%s)->%d", child, err);
                return;
            }
            fs_print_dir(&c, child, level+1);
        }
    }
}

void fs_print_tree() {
    lfs_dir_t root;
    int err = dir_open(&root, "");
    if (err != 0) {
        Serial.printf("Error opening root: %d\n", err);
        return;
    }
    Serial.println("----- directory tree");
    fs_print_dir(&root, "", 0);
    Serial.println("-----");
}
// setup() runs once, when the device is first turned on.
void setup() {
  // Put initialization like pinMode and begin functions here.

  Serial.begin();
  Serial.println("Setup"); 
  lfs_dir_t root;
  // int err = dir_open(&root, "");
  // Serial.printf("dir_open: %d", err);
  // fs_print_tree();


}

// loop() runs over and over again, as quickly as it can execute.
void loop() {
  // The core of your code will likely live here.
  

}