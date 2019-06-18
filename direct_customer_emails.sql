SELECT
	zendesk_v4.tickets.via__source__to__address,
	zendesk_v4.tickets.raw_subject,
	zendesk_v4.tickets.description
FROM
	zendesk_v4.tickets
--Filter out purchase notifications, voicemails, images, replies, null headlines and order tracking emails
WHERE (zendesk_v4.tickets.raw_subject NOT LIKE 'Re:%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Recurring Custom Plan Purchase%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Non-recurring Custom Plan Purchase'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Voicemail%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'RE:%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE 'Fw%'
	AND zendesk_v4.tickets.description NOT LIKE 'IMG%'
	AND zendesk_v4.tickets.description NOT LIKE 'image%'
	AND zendesk_v4.tickets.raw_subject NOT LIKE '(#%'
	AND zendesk_v4.tickets.raw_subject IS NOT NULL)
--Ensure that the 'to' email address is to VShred or SculptNation
AND (zendesk_v4.tickets.via__source__to__address LIKE '%@vshred.com'
	OR zendesk_v4.tickets.via__source__to__address LIKE '%@sculptnation.com'
	OR zendesk_v4.tickets.via__source__to__address LIKE '%@vinsanity%');