# Heroes of Might and Magic III Demo Builder for VCMI

This script extracts and merges the **official Windows demo** (based on *Restoration of Erathia* from 1999) and the **official MacOS demo** (based on the *Complete Edition* from 2000) of *Heroes of Might and Magic III* to create a compatible version for **VCMI**, specifically for use with the ➡️ [Heroes III Demo Support Mod](https://github.com/vcmi-mods/mac-demo-support).


## 📜 Requirements
- **Windows Demo**: `h3demo.exe`
- **MacOS Demo**:  
  - Either: `heroes_3_complete_demo.sit`  
  - Or: `heroes_3_complete_demo.7z.001` + `heroes_3_complete_demo.7z.002`
- **Included Tools**:
  - [`7za.exe`](https://www.7-zip.org/) – Extracts `.exe` and `.7z` files
  - [`i5comp.exe`](http://cd.textfiles.com/simtel/simtel0303/disk1/ARCUTIL/) – Extracts `.cab` files
  - [`unar.exe`](https://unarchiver.c3.cx/commandline) – Extracts `.sit` archives
  - `lodmerge.exe` – Merges `.lod`, `.snd`, and `.vid` files


## 🔧 How to Use
1. **Download** this repository and extract it to any folder.
2. **Run** `extract.cmd`.  
3. **Once the process is complete,** the extracted files will be located in the `demo` directory.
4. **Open VCMI Launcher**, click **Copy existing data**, and select the newly created `demo` directory.
5. **Go to the Mods tab** in VCMI Launcher, install, and enable the **Heroes III Demo** mod.  
   ⚠️ *If this mod is not enabled, the game will crash!*
6. **You're now ready to play!** 🎮



## 🔍 How It Works
1. **Extracts the Windows demo**:
   - `h3demo.exe` is extracted using `7za.exe`.
   - `data1.cab` is extracted using `i5comp.exe`.
2. **Extracts the MacOS demo**:
   - If using the split archive:  
     - `heroes_3_complete_demo.7z.001` + `heroes_3_complete_demo.7z.002` are extracted using `7za.exe`, producing `heroes_3_complete_demo.sit`.  
   - `heroes_3_complete_demo.sit` is then extracted using `unar.exe`.
3. **Merges necessary files**:
   - `.lod`, `.snd`, and `.vid` files from the MacOS demo are merged into the Windows demo using `lodmerge.exe`.
   - **Other necessary files**, such as music and maps, are copied to the final `demo` directory.


## 🎉 Credits
This project utilizes the following tools:
- [7-Zip](https://www.7-zip.org/) (`7za.exe`) – Igor Pavlov
- [i5comp](http://cd.textfiles.com/simtel/simtel0303/disk1/ARCUTIL/) – JBSoft
- [The Unarchiver](https://unarchiver.c3.cx/) (`unar.exe`) – Dag Ågren
- `lodmerge.exe` – **Author unknown**

A huge thanks to the developers of these tools for their amazing work! 🙌

---

## 📢 License
This script is provided **as-is** with no warranties. It is intended for **educational and archival purposes only**. 

---
