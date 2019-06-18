SELECT
	zendesk_v4.tickets.via__source__to__address,
	zendesk_v4.tickets.raw_subject,
	zendesk_v4.tickets.description
FROM
	zendesk_v4.tickets
WHERE (zendesk_v4.tickets.raw_subject NOT LIKE 'Re:%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Recurring Custom Plan Purchase%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'RE:%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Fw%')
AND (zendesk_v4.tickets.via__source__to__address LIKE '%@vshred.com'
	OR zendesk_v4.tickets.via__source__to__address LIKE '%@sculptnation.com'
	OR zendesk_v4.tickets.via__source__to__address LIKE '%@vinsanity%');