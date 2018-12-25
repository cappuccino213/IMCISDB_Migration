--插入visit表
INSERT INTO Visit (
		VisitUID,
		PatientID,
		PIDAssigningAuthority,
		PatientMasterID,
		VisitID,
		AlternateVisitID,
		AssigningAuthority,
		PatientClass,
		PatientType,
		MedRecNO,
		OutPatientNO,
		InPatientNO,
		CardType,
		CardNO,
		Age,
		AgeUnit,
		MaritalStatus,
		PregnancyFlag,
		Occupation,
		OrganizationID,
		AdmitDate,
		ReAmissionFlag,
		AdmissionType,
		AdmitPatCondition,
		AdmitDeptID,
		AdmitDeptName,
		DeptID,
		DeptName,
		PointOfCare,
		PointOfCareID,
		Room,
		Bed,
		AdmittingDoctorID,
		AdmittingDoctorName,
		AttendingDoctorID,
		AttendingDoctorName,
		DirectorDoctorID,
		DirectorDoctorName,
		CurPatCondition,
		NursingGrade,
		DietType,
		PrimaryDiagnosis,
		DischargeDate,
		DischargeDisposition,
		TotalCharges,
		TotalPayments,
		PaymentMode,
		MedicalPaymentMode,
		LastUpdateDate,
		DeleteFlag
	)VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);

INSERT INTO ExamRequest (
	ExamUID,
	PatientID,
	PIDAssigningAuthority,
	PatientMasterID,
	PatientClass,
	VisitUID,
	OrderUID,
	OrganizationID,
	PlacerOrderNO,
	PlacerAssigningAuthority,
	PlacerOrderDetailNO,
	FillerOrderNO,
	FillerAssigningAuthority,
	FillerPatientID,
	AccessionNumber,
	ServiceID,
	ServiceCodeScheme,
	ServiceText,
	ServiceIDInsur,
	ServiceSectID,
	ProcedureID,
	ProcedureName,
	ProviderID,
	ProviderName,
	ProviderPhone,
	RequestDeptID,
	RequestDeptName,
	RequestOrgID,
	RequestOrgName,
	RequestedDate,
	Reason,
	Attention,
	Symptom,
	AdverseReaction,
	ClinicDiagnosis,
	RelevantClinicalInfo,
	FastingFlag,
	TransportationMode,
	RegTime,
	RegisterID,
	RegisterName,
	ExamDeptID,
	ExamDeptName,
	ExamDate,
	ExamEndDate,
	ExamLocation,
	ExamEquipmentID,
	ExamEquipment,
	EquipmentModel,
	ExamMethod,
	StudyInstanceUID,
	TechnicianID,
	TechnicianName,
	ResultAssistantID,
	ResultAssistantName,
	ResultPrincipalID,
	ResultPrincipalName,
	ResultReviseID,
	ResultReviseName,
	PreliminaryDate,
	AuditDate,
	ReviseDate,
	ResultDate,
	ResultOrganizationID,
	ResultServiceCenterUID,
	ResultStatus,
	ResultStatusCode,
	ResultPrintCount,
	ResultPrintTime,
	AbnormalFlags,
	CriticalValue,
	InfectionName,
	PrivacyLevel,
	PrivacyLevelExt,
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
	DataSource,
	LockFlag,
	LockUserUID,
	LockReason,
	InWritingUserUID,
	MessageCount,
	UnProcessWorkflowCount,
	PushState,
	DeleteFlag,
	GroupID
)
VALUES
	(
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s,
	%s
	);

INSERT INTO ExamResult (
	ExamUID,
	ImagingFinding,
	ImagingDiagnosis,
	ResultStatus,
	ResultStatusCode,
	ReferencesRange,
	AbnormalFlags,
	ExamMethod,
	ExamDate,
	PreliminaryDate,
	AuditDate,
	ResultPrincipalID,
	ResultPrincipalName,
	ResultAssistantID,
	ResultAssistantName,
	LastUpdateDate,
	DeleteFlag
)
VALUES
	(
		%s,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s
	);

INSERT INTO PatientIndex (
	PatientID,
	PIDAssigningAuthority,
	IsMPI,
	PatientMasterID,
	Password,
	CreateDate,
	CreateUserID,
	CreateUserName,
	CreateOrgnizationID,
	Name,
	NameSpell,
	MotherName,
	Sex,
	BirthDate,
	BirthPlace,
	Nation,
	Citizenship,
	MaritalStatus,
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
	AddressDetail,
	Postalcode,
	Occupation,
	WorkUnit,
	LANGUAGE,
	LastUpdateDate,
	InHospitalFlag,
	Status
)
VALUES
	(
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s
	);

INSERT INTO Document (
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
)
VALUES
	(
		%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s ,%s
	);

INSERT INTO DocumentInService (
	FileUID,
	ServiceUID,
	MediaUID,
	FileRelativePath,
	CreateTime,
	DeleteFlag,
	MigrationFlag,
	FileDeleteFlag
)
VALUES
	(
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s,
		%s
	)