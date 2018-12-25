SELECT
	VisitUID,
	CONVERT (nvarchar, PatientID),
	CONVERT (
		nvarchar,
		PIDAssigningAuthority
	),
	PatientMasterID,
	CONVERT (nvarchar, VisitID),
	CONVERT (nvarchar, AlternateVisitID),
	CONVERT (
		nvarchar,
		AssigningAuthority
	),
	CONVERT (nvarchar, PatientClass),
	CONVERT (nvarchar, PatientType),
	CONVERT (nvarchar, MedRecNO),
	CONVERT (nvarchar, OutPatientNO),
	CONVERT (nvarchar, InPatientNO),
	CONVERT (nvarchar, CardType),
	CONVERT (nvarchar, CardNO),
	Age,
	CONVERT (nvarchar, AgeUnit),
	CONVERT (nvarchar, MaritalStatus),
	PregnancyFlag,
	CONVERT (nvarchar, Occupation),
	CONVERT (nvarchar, OrganizationID),
	AdmitDate,
	ReAmissionFlag,
	CONVERT (nvarchar, AdmissionType),
	CONVERT (nvarchar, AdmitPatCondition),
	CONVERT (nvarchar, AdmitDeptID),
	CONVERT (nvarchar, AdmitDeptName),
	CONVERT (nvarchar, DeptID),
	CONVERT (nvarchar, DeptName),
	CONVERT (nvarchar, PointOfCare),
	CONVERT (nvarchar, PointOfCareID),
	CONVERT (nvarchar, Room),
	CONVERT (nvarchar, Bed),
	CONVERT (nvarchar, AdmittingDoctorID),
	CONVERT (
		nvarchar,
		AdmittingDoctorName
	),
	CONVERT (nvarchar, AttendingDoctorID),
	CONVERT (
		nvarchar,
		AttendingDoctorName
	),
	CONVERT (nvarchar, DirectorDoctorID),
	CONVERT (
		nvarchar,
		DirectorDoctorName
	),
	CONVERT (nvarchar, CurPatCondition),
	CONVERT (nvarchar, NursingGrade),
	CONVERT (nvarchar, DietType),
	CONVERT (nvarchar, PrimaryDiagnosis),
	DischargeDate,
	CONVERT (
		nvarchar,
		DischargeDisposition
	),
	TotalCharges,
	TotalPayments,
	CONVERT (nvarchar, PaymentMode),
	CONVERT (
		nvarchar,
		MedicalPaymentMode
	),
	LastUpdateDate,
	DeleteFlag
FROM
	Visit;

SELECT
	ObservationUID,
	CONVERT (nvarchar, PatientID),
	CONVERT (
		nvarchar,
		PIDAssigningAuthority
	),
	PatientMasterID,
	CONVERT (nvarchar, PatientClass),
	VisitUID,
	OrderUID,
	CONVERT (nvarchar, OrganizationID),
	CONVERT (nvarchar, PlacerOrderNO),
	CONVERT (
		nvarchar,
		PlacerAssigningAuthority
	),
	CONVERT (
		nvarchar,
		PlacerOrderDetailNO
	),
	CONVERT (nvarchar, FillerOrderNO),
	CONVERT (
		nvarchar,
		FillerAssigningAuthority
	),
	CONVERT (nvarchar, FillerPatientID),
	CONVERT (nvarchar, AccessionNumber),
	CONVERT (nvarchar, ServiceID),
	CONVERT (nvarchar, ServiceCodeScheme),
	CONVERT (nvarchar, ServiceText),
	CONVERT (nvarchar, ServiceIDInsur),
	CONVERT (nvarchar, ServiceSectID),
	CONVERT (nvarchar, ProcedureID),
	CONVERT (nvarchar, ProcedureName),
	CONVERT (nvarchar, ProviderID),
	CONVERT (nvarchar, ProviderName),
	CONVERT (nvarchar, ProviderPhone),
	CONVERT (nvarchar, RequestDeptID),
	CONVERT (nvarchar, RequestDeptName),
	CONVERT (nvarchar, RequestOrgID),
	CONVERT (nvarchar, RequestOrgName),
	RequestedDate,
	CONVERT (nvarchar, Reason),
	CONVERT (nvarchar, Attention),
	CONVERT (nvarchar, Symptom),
	CONVERT (nvarchar, AdverseReaction),
	CONVERT (nvarchar, ClinicDiagnosis),
	CONVERT (
		nvarchar,
		RelevantClinicalInfo
	),
	FastingFlag,
	CONVERT (
		nvarchar,
		TransportationMode
	),
	RegTime,
	CONVERT (nvarchar, RegisterID),
	CONVERT (nvarchar, RegisterName),
	CONVERT (nvarchar, ObservationDeptID),
	CONVERT (
		nvarchar,
		ObservationDeptName
	),
	ObservationDate,
	ObservationEndDate,
	CONVERT (
		nvarchar,
		ObservationLocation
	),
	CONVERT (
		nvarchar,
		ObservationEquipmentID
	),
	CONVERT (
		nvarchar,
		ObservationEquipment
	),
	CONVERT (nvarchar, EquipmentModel),
	CONVERT (nvarchar, ObservationMethod),
	CONVERT (nvarchar, StudyInstanceUID),
	CONVERT (nvarchar, TechnicianID),
	CONVERT (nvarchar, TechnicianName),
	CONVERT (nvarchar, ResultAssistantID),
	CONVERT (
		nvarchar,
		ResultAssistantName
	),
	CONVERT (nvarchar, ResultPrincipalID),
	CONVERT (
		nvarchar,
		ResultPrincipalName
	),
	CONVERT (nvarchar, ResultReviseID),
	CONVERT (nvarchar, ResultReviseName),
	PreliminaryDate,
	AuditDate,
	ReviseDate,
	ResultDate,
	CONVERT (
		nvarchar,
		ResultOrganizationID
	),
	ResultServiceCenterUID,
	CONVERT (nvarchar, ResultStatus),
	CONVERT (nvarchar, ResultStatusCode),
	ResultPrintCount,
	ResultPrintTime,
	CONVERT (nvarchar, AbnormalFlags),
	CONVERT (nvarchar, CriticalValue),
	CONVERT (nvarchar, InfectionName),
	PrivacyLevel,
	CONVERT (nvarchar, PrivacyLevelExt),
	Charges,
	Payments,
	PaymentsFlag,
	FilmCount,
	FilmNeed,
	HasImage,
	ImageLocation,
	ConsultStatus,
	ConsultRequestDate,
	ConsultEndDate,
	LastUpdateDate,
	CONVERT (nvarchar, DataSource),
	LockFlag,
	LockUserUID,
	CONVERT (nvarchar, LockReason),
	InWritingUserUID,
	MessageCount,
	UnProcessWorkflowCount,
	PushState,
	DeleteFlag,
	CONVERT (nvarchar, GroupID)
FROM
	ObservationRequest;

SELECT
	ObservationUID,
	CONVERT (nvarchar, INSPECTIONRESULT),
	CONVERT (nvarchar, DIAGNOSE),
	CONVERT (nvarchar, ResultStatus),
	CONVERT (nvarchar, ResultStatusCode),
	CONVERT (nvarchar, ReferencesRange),
	CONVERT (nvarchar, AbnormalFlags),
	CONVERT (nvarchar, ObservationMethod),
	ObservationDate,
	PreliminaryDate,
	AuditDate,
	CONVERT (nvarchar, ResultPrincipalID),
	CONVERT (
		nvarchar,
		ResultPrincipalName
	),
	CONVERT (nvarchar, ResultAssistantID),
	CONVERT (
		nvarchar,
		ResultAssistantName
	),
	LastUpdateDate,
	DeleteFlag
FROM
	ExamResult;

SELECT
	PatientID,
	PIDAssigningAuthority,
	IsMPI,
	PatientMasterID,
	Password,
	CreateDate,
	CreateUserID,
	CreateUserName,
	CreateOrgnizationID,
	CONVERT (nvarchar, Name),
	NameSpell,
	MotherName,
	CONVERT (nvarchar, Sex),
	BirthDate,
	BirthPlace,
	Nation,
	Citizenship,
	CONVERT (nvarchar, MaritalStatus),
	IdentityType,
	IdentityID,
	IDCardNO,
	HealthCardNO,
	InsuranceType,
	InsuranceID,
	ContactPhoneNO,
	HomePhoneNO,
	BusinessPhoneNO,
	Email,
	AddressProvince,
	AddressCity,
	AddressDistrict,
	AddressStreet,
	AddressRoad,
	CONVERT (nvarchar, AddressDetail),
	Postalcode,
	Occupation,
	WorkUnit,
	LANGUAGE,
	LastUpdateDate,
	InHospitalFlag,
	Status
FROM
	PatientIndex;

SELECT
	FileUID,
	BusinessID,
	BusinessType,
	BusinessTime,
	ClassCode,
	TypeCode,
	FormatCode,
	EntryUUID,
	UniqueID,
	MimeType,
	FileSHA,
	FileSize,
	FileCreateTime,
	FileCreateUserID,
	FileCreateUserName,
	CreateOrganizationID,
	OriginalFileName,
	Title,
	UploadTime,
	ParentFileUID,
	TransformMimeType,
	DicomInfo,
	DeleteFlag,
	FolderFlag
FROM
	Document;

SELECT
	*
FROM
	DocumentInservice
