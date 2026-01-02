<a name="top"/>

# ArmA
A continuation of arma1button

## Table of Contents
- [Quickstart](#quickstart)
- [Files](#files)

###### [Go to Top](#top)

### Quickstart
- Have maxhougas/steambox:db
- Build arma3:mod
  - `./build.arma3.mod.sh`
- Create arma3mod
  - `./create.arma3.mod.sh`
- Start arma3mod
  - `docker start arma3mod`
- Build arma3:db 
  - `./build.arma3.db.sh`
- Create arma3
  - `./create.arma3.db.sh`
- Start arma3
  - `docker start arma3`

###### [Go to Top](#top)

### Files
- build.arma3.db.sh: Generates the arma3:db image.
- build.arma3.mod.sh: Generates the arma3:mod image.
- create.arma3.db.sh: Creates the arma3 container.
- create.arma3.mod.sh: Creates the arma3mod container.
- knownmods: Long list of mods hopefully in dependency order.
- mount/creds: Steam credentials UNAME PASS AUTH; create yourself.
- mount/finalizemissions.sh: Links mission files.
- mount/finalizemods.sh: Normalizes mod files; links bikeys.
- mount/listdlc: ID list of cdlc.
  - Valid IDs `gm, vn, csla, ws, spe, rf, ef`
- mount/listmissions: ID=NAME list of missions.
- mount/listmods: ID=NAME list of mods; must be in dependency order.
- mount/missions: Shared space for mission files.
- mount/mods: Shared space for mod files.
- mount/params: Parameters file [ArmA Wiki](https://community.bistudio.com/wiki/Startup_Parameters_Config_File).
- mount/saves: Shared space for save files.
- mount/server.cfg: Server config file [ArmA Wiki](https://community.bistudio.com/wiki/Arma_3:_Server_Config_File).
- README.md: this

###### [Go to Top](#top)
