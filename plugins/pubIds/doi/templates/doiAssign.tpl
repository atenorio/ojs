{**
 * @file plugins/pubIds/doi/templates/doiAssign.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Assign DOI to an object option.
 *}

{assign var=pubObjectType value=$pubIdPlugin->getPubObjectType($pubObject)}
{assign var=enableObjectDoi value=$pubIdPlugin->getSetting($currentJournal->getId(), "enable`$pubObjectType`Doi")}
{if $enableObjectDoi}
	{if $pubObject->getStoredPubId($pubIdPlugin->getPubIdType())}
		{fbvFormSection}
			<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.assignDoi.assigned" pubId=$pubObject->getStoredPubId($pubIdPlugin->getPubIdType())}</p>
		{/fbvFormSection}
	{else}
		{assign var=pubId value=$pubIdPlugin->getPubId($pubObject)}
		{if !$canBeAssigned}
			{fbvFormSection}
				{if !$pubId}
					<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.assignDoi.emptySuffix"}</p>
				{else}
					<p class="pkp_help">{translate key="plugins.pubIds.doi.editor.assignDoi.pattern" pubId=$pubId}</p>
				{/if}
			{/fbvFormSection}
		{else}
			{assign var=templatePath value=$pubIdPlugin->getTemplatePath()}
			{include file="`$templatePath`doiAssignCheckBox.tpl" pubId=$pubId pubObjectType=$pubObjectType}
		{/if}
	{/if}
{/if}
