// Global Commands
MedicalActions = compile preprocessFileLineNumbers "Medical\MedicalActions.sqf";
MedicalDamage = compile preprocessFileLineNumbers "Medical\MedicalDamage.sqf";
MedicalMassActions = compile preprocessFileLineNumbers "Medical\MedicalMassActions.sqf";
MedicalMassPatients = compile preprocessFileLineNumbers "Medical\MedicalMassPatients.sqf";
MedicalPatient = compile preprocessFileLineNumbers "Medical\MedicalPatient.sqf";
MedicalQualificationActions = compile preprocessFileLineNumbers "Medical\MedicalQualificationActions.sqf";
MedicalQualificationPatients = compile preprocessFileLineNumbers "Medical\MedicalQualificationPatients.sqf";

// Individual Exercise
[MedicalData_1,PatientSpawn_1] execVM "Medical\MedicalActions.sqf";
[MedicalData_2,PatientSpawn_2] execVM "Medical\MedicalActions.sqf";
[MedicalData_3,PatientSpawn_3] execVM "Medical\MedicalActions.sqf";
[MedicalData_4,PatientSpawn_4] execVM "Medical\MedicalActions.sqf";
[MedicalData_5,PatientSpawn_5] execVM "Medical\MedicalActions.sqf";
[MedicalData_6,PatientSpawn_6] execVM "Medical\MedicalActions.sqf";
[MedicalData_7,PatientSpawn_7] execVM "Medical\MedicalActions.sqf";
[MedicalData_8,PatientSpawn_8] execVM "Medical\MedicalActions.sqf";
[MedicalData_9,PatientSpawn_9] execVM "Medical\MedicalActions.sqf";
[MedicalData_10,PatientSpawn_10] execVM "Medical\MedicalActions.sqf";

// Team Exercise
[MedicalData_11,PatientSpawn_11] execVM "Medical\MedicalActions.sqf";
[MedicalData_12,PatientSpawn_12] execVM "Medical\MedicalActions.sqf";
[MedicalData_13,PatientSpawn_13] execVM "Medical\MedicalActions.sqf";

// Mass Tier 1 Casualty
[MedicalMass_1] execVM "Medical\MedicalMassActions.sqf";

// Qualification Course
[MedicalQualificationData_1,MedicalQualificationSpawn_1,Barrier_1] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_2,MedicalQualificationSpawn_2,Barrier_2] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_3,MedicalQualificationSpawn_3,Barrier_3] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_4,MedicalQualificationSpawn_4,Barrier_4] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_5,MedicalQualificationSpawn_5,Barrier_5] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_6,MedicalQualificationSpawn_6,Barrier_6] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_7,MedicalQualificationSpawn_7,Barrier_7] execVM "Medical\MedicalQualificationActions.sqf";
[MedicalQualificationData_8,MedicalQualificationSpawn_8,Barrier_8] execVM "Medical\MedicalQualificationActions.sqf";