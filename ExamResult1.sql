IF EXISTS(SELECT 1 FROM sys.views WHERE name='ExamResult')
DROP VIEW ExamResult
GO
CREATE VIEW ExamResult AS SELECT DISTINCT
	o.ObservationUID,
	(
		SELECT
			TOP (1) b.ValueText
		FROM
			ObservationResult AS b WITH (NOLOCK)
		WHERE
			(
				o.ObservationUID = b.ObservationUID
			)
		AND (b.ObservationID = 'GDT')
	) AS INSPECTIONRESULT,
	(
		SELECT
			TOP (1) b1.ValueText
		FROM
			ObservationResult AS b1 WITH (NOLOCK)
		WHERE
			(
				o.ObservationUID = b1.ObservationUID
			)
		AND (b1.ObservationID = 'IMP')
	) AS DIAGNOSE,
	R.ResultStatus,
	R.ResultStatusCode,
	R.ReferencesRange,
	R.AbnormalFlags,
	R.ObservationMethod,
	R.ObservationDate,
	R.PreliminaryDate,
	R.AuditDate,
	R.ResultPrincipalID,
	R.ResultPrincipalName,
	R.ResultAssistantID,
	R.ResultAssistantName,
	R.LastUpdateDate,
	R.DeleteFlag
FROM
	ObservationRequest AS o WITH (NOLOCK)
INNER JOIN ObservationResult R ON o.ObservationUID = R.ObservationUID
WHERE
	R.DeleteFlag = 0
GO