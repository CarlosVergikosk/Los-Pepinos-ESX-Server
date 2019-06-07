# esx_LPdrugs
esx_LPdrugs

[REQUIREMENTS]

  * esx_policejob => https://github.com/FXServer-ESX/fxserver-esx_policejob


  [UPDATE]
  to install opium :
```
INSERT INTO `items` (name, label) VALUES
	('opium', 'Opium'),
	('opium_pooch', 'Pochon de opium')
;
```
  
  [INSTALLATION]

1) * Import esx_drugs.sql in your database

2) Add this in your server.cfg :

```
start esx_LPdrugs
```

[FEATURES]
* Use weed
* NEW drug! - Pepinos 
* Cops can't see or interact with the drugs zones
* In the config.lua change the Config.RequiredCop to block the drugs zone in function of the cops count conected
