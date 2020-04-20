<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" labelsEnabled="1" simplifyAlgorithm="0" minScale="1e+8" version="3.2.3-Bonn" simplifyDrawingHints="1" readOnly="0" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" maxScale="0" simplifyDrawingTol="1">
  <renderer-v2 symbollevels="0" type="RuleRenderer" enableorderby="0" forceraster="0">
    <rules key="{6e19d5e1-ebcc-4858-ab59-730850fcb1d0}">
      <rule label="BRS" key="{1e5a7b63-f355-42ff-bc8e-46c77b948125}" symbol="0" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'BRS'">
        <rule label="Line Objects" key="{89d1fd1a-1fae-4f47-a9d8-04487501294a}" scalemaxdenom="25000" scalemindenom="500" symbol="1" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="SDP" key="{d17a2d67-7c76-4d76-bf5b-9322c97b7bfb}" symbol="2" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'SDP'">
        <rule label="Line Objects" key="{3b94ee39-22d6-4bf7-b5bd-40d71a742226}" scalemaxdenom="25000" scalemindenom="500" symbol="3" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="BRSDP" key="{a4b0dfba-ff6d-4f79-85ff-8ed456ef7d61}" symbol="4" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'BRSDP'">
        <rule label="Line Objects" key="{5631f5a5-dbf3-48d7-b590-41454f367315}" scalemaxdenom="25000" scalemindenom="500" symbol="5" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="FEMA" key="{31166ece-b6d3-413d-99d4-3ef3dd233f69}" symbol="6" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'FEMA'">
        <rule label="Line Objects" key="{c60d77a1-1b09-49bf-a5ba-668850253ef5}" scalemaxdenom="25000" scalemindenom="500" symbol="7" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="MIS" key="{45e849f6-39d3-44c5-a5af-6354b91e56d6}" symbol="8" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'MIS'">
        <rule label="Line Objects" key="{0613835e-6b93-4c57-87d6-3658991bcaf5}" scalemaxdenom="25000" scalemindenom="500" symbol="9" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Research" key="{98cce8cb-1ee2-497a-a300-1d4c66777f48}" symbol="10" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Research'">
        <rule label="Line Objects" key="{8c5d0d82-4bb6-4dd1-8160-16797cf29aa0}" scalemaxdenom="25000" scalemindenom="500" symbol="11" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Stake Line" key="{18f9bfc1-2ce0-4951-a836-04d121d0cd30}" symbol="12" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Stake Line'">
        <rule label="Line Objects" key="{f22f4b92-94bb-4f5c-ab23-ecb5f2492751}" scalemaxdenom="25000" scalemindenom="500" symbol="13" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Flag Line" key="{eb3bd3db-b01c-4aa5-b69d-9ca971903c8b}" symbol="14" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Flag Line'">
        <rule label="Line Objects" key="{15c42b3c-ff05-4c23-9e9a-0ecfcc476fae}" scalemaxdenom="25000" scalemindenom="500" symbol="15" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Stake Out" key="{3191cb64-9079-45bf-99d2-c4f83d751f28}" symbol="16" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Stake Out'">
        <rule label="Line Objects" key="{34d43701-69e5-4e32-bb04-08725d9e58cd}" scalemaxdenom="25000" scalemindenom="500" symbol="17" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Subdivision" key="{4ffcbb3c-5cd0-4e7e-b0f2-91bee2d9cd54}" symbol="18" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Subdivision'">
        <rule label="Line Objects" key="{27013f12-3249-44a6-90af-7930551a1f4d}" scalemaxdenom="25000" scalemindenom="500" symbol="19" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Route Survey" key="{a6273937-b18c-467c-bbd6-d987ab251794}" symbol="20" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Route Survey'">
        <rule label="Line Objects" key="{ea997695-c1c8-463e-8315-927afe86c13b}" scalemaxdenom="25000" scalemindenom="500" symbol="21" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="As-built" key="{676d2a60-6698-4fd4-9f4d-5b4e3695bb6f}" symbol="22" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'As-built'">
        <rule label="Line Objects" key="{233b102c-ca37-4311-9069-3c5feee5891c}" scalemaxdenom="25000" scalemindenom="500" symbol="23" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Bathymetric Survey" key="{730ec2b7-a613-4df0-8e96-5638975b2765}" symbol="24" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Bathymetric Survey'">
        <rule label="Line Objects" key="{8afb3617-04f3-4763-874d-ece2c79ad3be}" scalemaxdenom="25000" scalemindenom="500" symbol="25" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule label="Other Job" key="{2c829efa-c695-48be-81b9-0bfedd3848c7}" symbol="26" filter="CASE &#xd;&#xa;WHEN (&quot;job_type&quot; = '01') THEN 'BRS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '02') THEN 'SDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '03') THEN 'BRSDP'&#xd;&#xa;WHEN (&quot;job_type&quot; = '04') THEN 'FEMA'&#xd;&#xa;WHEN (&quot;job_type&quot; = '05') THEN 'MIS'&#xd;&#xa;WHEN (&quot;job_type&quot; = '06') THEN 'Research'&#xd;&#xa;WHEN (&quot;job_type&quot; = '07') THEN 'Flag Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '08') THEN 'Stake Line'&#xd;&#xa;WHEN (&quot;job_type&quot; = '09') THEN 'Stake Out'&#xd;&#xa;WHEN (&quot;job_type&quot; = '10') THEN 'Subdivision'&#xd;&#xa;WHEN (&quot;job_type&quot; = '11') THEN 'Route Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '12') THEN 'Easement'&#xd;&#xa;WHEN (&quot;job_type&quot; = '13') THEN 'Bathymetric Survey'&#xd;&#xa;WHEN (&quot;job_type&quot; = '14') THEN 'As-built'&#xd;&#xa;WHEN (&quot;job_type&quot; = '15') THEN 'Affadavit'&#xd;&#xa;WHEN (&quot;job_type&quot; = '16') THEN 'Surveyors report'&#xd;&#xa;WHEN (&quot;job_type&quot; = '17') THEN 'Other Job'&#xd;&#xa;END = 'Other Job'">
        <rule label="Line Objects" key="{be35cf9c-af46-4944-be8d-25080e2ea1a8}" scalemaxdenom="25000" scalemindenom="500" symbol="27" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
      <rule key="{e82fb555-6ada-45d4-aba4-8d387c8c1f0b}" symbol="28" filter="ELSE">
        <rule label="Line Objects" key="{705c6f58-9bcf-48b8-9cf8-43a52a3beb1e}" scalemaxdenom="25000" scalemindenom="500" symbol="29" filter="&quot;objectType&quot; = 'road' or&#xd;&#xa;&quot;objectType&quot; = 'utility' or&#xd;&#xa;&quot;objectType&quot; = 'easement'"/>
      </rule>
    </rules>
    <symbols>
      <symbol type="fill" name="0" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="78,229,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="78,229,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="1" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="78,229,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="78,229,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="10" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="246,248,226,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="246,248,226,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="11" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="246,248,226,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="246,248,226,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="12" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="161,214,166,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="161,214,166,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="13" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="161,214,166,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="161,214,166,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="14" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="204,242,208,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="204,242,208,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="15" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="204,242,208,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="204,242,208,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="16" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,224,91,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,224,91,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="17" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="255,224,91,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="255,224,91,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="18" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="49,67,230,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="49,67,230,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="19" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="49,67,230,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="49,67,230,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="2" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="204,75,81,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="204,75,81,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="20" clip_to_extent="1" alpha="0.607">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="246,121,233,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="246,121,233,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="21" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="246,121,233,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="246,121,233,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="22" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="237,253,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="237,253,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="23" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="237,253,255,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="237,253,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="24" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,204,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,204,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="25" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="0,204,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="0,204,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="26" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="134,134,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="134,134,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="27" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="134,134,0,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="134,134,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="28" clip_to_extent="1" alpha="0.607">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="43,131,186,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="29" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="43,131,186,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="43,131,186,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="3" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="204,75,81,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="204,75,81,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="4" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="177,90,231,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="5" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="177,90,231,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="177,90,231,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="6" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="250,146,55,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="250,146,55,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="7" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="250,146,55,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="250,146,55,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="8" clip_to_extent="1" alpha="0.75">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="67,227,184,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol type="fill" name="9" clip_to_extent="1" alpha="1">
        <layer enabled="1" class="SimpleFill" pass="0" locked="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="67,227,184,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="Point" k="offset_unit"/>
          <prop v="67,227,184,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="5" k="outline_width"/>
          <prop v="Point" k="outline_width_unit"/>
          <prop v="no" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="">
      <rule key="" scalemaxdenom="7500" description="Line Labels" scalemindenom="1" filter=" &quot;objectType&quot; = 'road' or&#xd;&#xa;  &quot;objectType&quot; = 'utility' or&#xd;&#xa;   &quot;objectType&quot; = 'easement' ">
        <settings>
          <text-style namedStyle="Regular" previewBkgrdColor="#ffffff" fontStrikeout="0" fontSize="8.25" fontUnderline="0" textOpacity="1" fontWordSpacing="0" fontFamily="MS Shell Dlg 2" useSubstitutions="0" multilineHeight="1" isExpression="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="255,161,9,255" blendMode="0" fontWeight="50" fieldName="job_no" fontLetterSpacing="0" fontItalic="0" fontCapitals="0" fontSizeUnit="Point">
            <text-buffer bufferOpacity="1" bufferBlendMode="0" bufferSize="1" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferDraw="1" bufferColor="89,89,89,255" bufferSizeUnits="MM"/>
            <background shapeOffsetY="0" shapeSizeY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeRadiiUnit="MM" shapeSizeType="0" shapeOpacity="1" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeRadiiX="0" shapeOffsetUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="MM" shapeRadiiY="0" shapeType="0" shapeFillColor="255,255,255,255" shapeRotation="0" shapeRotationType="0" shapeBorderWidth="0" shapeBlendMode="0" shapeOffsetX="0" shapeBorderColor="128,128,128,255" shapeSizeX="0" shapeJoinStyle="64" shapeSVGFile=""/>
            <shadow shadowColor="0,0,0,255" shadowUnder="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.7" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowScale="100" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetDist="1" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" leftDirectionSymbol="&lt;" plussign="0" addDirectionSymbol="0" multilineAlign="4294967295" formatNumbers="0" rightDirectionSymbol=">" wrapChar="" reverseDirectionSymbol="0" decimals="3"/>
          <placement placementFlags="1" quadOffset="4" priority="5" centroidWhole="0" yOffset="0" centroidInside="1" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="Point" distUnits="Point" offsetType="0" maxCurvedCharAngleIn="25" offsetUnits="MapUnit" xOffset="0" preserveRotation="1" dist="2" repeatDistance="0" fitInPolygonOnly="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" distMapUnitScale="3x:0,0,0,0,0,0" placement="2" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25"/>
          <rendering obstacle="1" fontLimitPixelSize="0" minFeatureSize="5" displayAll="0" upsidedownLabels="0" obstacleType="0" zIndex="0" scaleVisibility="0" mergeLines="0" scaleMin="1" drawLabels="1" labelPerPart="0" obstacleFactor="1" scaleMax="10000000" limitNumLabels="1" fontMaxPixelSize="10000" fontMinPixelSize="3" maxNumLabels="500"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
      <rule key="" scalemaxdenom="7500" description="Polygon labels" scalemindenom="1" filter="ELSE">
        <settings>
          <text-style namedStyle="Regular" previewBkgrdColor="#ffffff" fontStrikeout="0" fontSize="8.25" fontUnderline="0" textOpacity="1" fontWordSpacing="0" fontFamily="MS Shell Dlg 2" useSubstitutions="0" multilineHeight="1" isExpression="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="255,161,9,255" blendMode="0" fontWeight="50" fieldName="job_no" fontLetterSpacing="0" fontItalic="0" fontCapitals="0" fontSizeUnit="Point">
            <text-buffer bufferOpacity="1" bufferBlendMode="0" bufferSize="1" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferDraw="1" bufferColor="89,89,89,255" bufferSizeUnits="MM"/>
            <background shapeOffsetY="0" shapeSizeY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeDraw="0" shapeRadiiUnit="MM" shapeSizeType="0" shapeOpacity="1" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeRadiiX="0" shapeOffsetUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeUnit="MM" shapeRadiiY="0" shapeType="0" shapeFillColor="255,255,255,255" shapeRotation="0" shapeRotationType="0" shapeBorderWidth="0" shapeBlendMode="0" shapeOffsetX="0" shapeBorderColor="128,128,128,255" shapeSizeX="0" shapeJoinStyle="64" shapeSVGFile=""/>
            <shadow shadowColor="0,0,0,255" shadowUnder="0" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowOpacity="0.7" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowScale="100" shadowRadiusUnit="MM" shadowDraw="0" shadowOffsetDist="1" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6"/>
            <substitutions/>
          </text-style>
          <text-format placeDirectionSymbol="0" leftDirectionSymbol="&lt;" plussign="0" addDirectionSymbol="0" multilineAlign="4294967295" formatNumbers="0" rightDirectionSymbol=">" wrapChar="" reverseDirectionSymbol="0" decimals="3"/>
          <placement placementFlags="10" quadOffset="4" priority="5" centroidWhole="0" yOffset="0" centroidInside="1" rotationAngle="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" distUnits="MM" offsetType="0" maxCurvedCharAngleIn="25" offsetUnits="MapUnit" xOffset="0" preserveRotation="1" dist="1" repeatDistance="0" fitInPolygonOnly="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" distMapUnitScale="3x:0,0,0,0,0,0" placement="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25"/>
          <rendering obstacle="1" fontLimitPixelSize="0" minFeatureSize="0" displayAll="0" upsidedownLabels="0" obstacleType="0" zIndex="0" scaleVisibility="0" mergeLines="0" scaleMin="1" drawLabels="1" labelPerPart="0" obstacleFactor="1" scaleMax="10000000" limitNumLabels="0" fontMaxPixelSize="10000" fontMinPixelSize="3" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions" value="COALESCE( &quot;folder_name&quot;, '&lt;NULL>' )"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>6</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory minScaleDenominator="0" opacity="1" backgroundAlpha="255" backgroundColor="#ffffff" penWidth="0" scaleDependency="Area" height="15" diagramOrientation="Up" width="15" barWidth="5" sizeType="MM" maxScaleDenominator="1e+8" labelPlacementMethod="XHeight" penAlpha="255" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" minimumSize="0" enabled="0" penColor="#000000" rotationOffset="270">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" zIndex="0" obstacle="0" showAll="1" placement="0" priority="0" linePlacementFlags="2">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option name="properties"/>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="sid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="map_bk_lot">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rev_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="old_plan_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="01" type="QString" name="BRS"/>
              </Option>
              <Option type="Map">
                <Option value="02" type="QString" name="SDP"/>
              </Option>
              <Option type="Map">
                <Option value="03" type="QString" name="BRSDP"/>
              </Option>
              <Option type="Map">
                <Option value="04" type="QString" name="FEMA"/>
              </Option>
              <Option type="Map">
                <Option value="05" type="QString" name="MIS"/>
              </Option>
              <Option type="Map">
                <Option value="06" type="QString" name="Research"/>
              </Option>
              <Option type="Map">
                <Option value="07" type="QString" name="Flag Line"/>
              </Option>
              <Option type="Map">
                <Option value="08" type="QString" name="Stake Line"/>
              </Option>
              <Option type="Map">
                <Option value="09" type="QString" name="Stakeout"/>
              </Option>
              <Option type="Map">
                <Option value="10" type="QString" name="Subdivision"/>
              </Option>
              <Option type="Map">
                <Option value="11" type="QString" name="Route Survey"/>
              </Option>
              <Option type="Map">
                <Option value="12" type="QString" name="Easement"/>
              </Option>
              <Option type="Map">
                <Option value="13" type="QString" name="Bathymetric Survey"/>
              </Option>
              <Option type="Map">
                <Option value="14" type="QString" name="As-built"/>
              </Option>
              <Option type="Map">
                <Option value="15" type="QString" name="Affidavit"/>
              </Option>
              <Option type="Map">
                <Option value="16" type="QString" name="Surveyors report"/>
              </Option>
              <Option type="Map">
                <Option value="17" type="QString" name="Other Job"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_desc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="client_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_addr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="locus_addr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="town">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="state">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_mobile">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_work">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_home">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="primary_contact">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_primary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_secondary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="recorded_by">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="planbook_page">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder_present">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="active">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pins_set">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="Map" name="map">
              <Option value="N/A" type="QString" name="N/A"/>
              <Option value="NO" type="QString" name="NO"/>
              <Option value="YES" type="QString" name="YES"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_recorded">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_requested">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_fw_sched">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_due">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_estimate_sent">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_dep">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="hrs_rs_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_rs_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_fw_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_fw_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_cad_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_cad_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_misc_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_misc_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_rs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_misc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_rs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_misc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_total">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_dep">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_prelim">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_finalplans">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_mylar">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_deeddesc">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_pins">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_fw">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_cad">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="copies_prelim">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_finalplans">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_mylar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_deeddesc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_pins">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_prelim">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_finalplans">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_mylar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_deeddesc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_pins">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="date_invoice1">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_invoice2">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_invoice3">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="amt_invoice1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_invoice2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_invoice3">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lowtide_hrs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lowtide">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="perimeter">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="area">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="abutters">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="objectid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="county">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="zipcode">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lat_lon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sPerimeter">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="old_plan">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="plan_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="client_role">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="estimate">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="objectid3">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="False" type="QString" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="objectType">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="jobSubtype">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="01" type="QString" name="Proposed addition"/>
              </Option>
              <Option type="Map">
                <Option value="02" type="QString" name="Conveyance parcel"/>
              </Option>
              <Option type="Map">
                <Option value="03" type="QString" name="Parcel split"/>
              </Option>
              <Option type="Map">
                <Option value="04" type="QString" name="ReFinance"/>
              </Option>
              <Option type="Map">
                <Option value="05" type="QString" name="Purchase"/>
              </Option>
              <Option type="Map">
                <Option value="06" type="QString" name="Sale"/>
              </Option>
              <Option type="Map">
                <Option value="07" type="QString" name="Right of Way"/>
              </Option>
              <Option type="Map">
                <Option value="08" type="QString" name="Site work"/>
              </Option>
              <Option type="Map">
                <Option value="09" type="QString" name="Inspection"/>
              </Option>
              <Option type="Map">
                <Option value="10" type="QString" name="Conservation"/>
              </Option>
              <Option type="Map">
                <Option value="11" type="QString" name="Aerial"/>
              </Option>
              <Option type="Map">
                <Option value="12" type="QString" name="Site"/>
              </Option>
              <Option type="Map">
                <Option value="13" type="QString" name="Historical"/>
              </Option>
              <Option type="Map">
                <Option value="14" type="QString" name="Archaeological"/>
              </Option>
              <Option type="Map">
                <Option value="15" type="QString" name="Family"/>
              </Option>
              <Option type="Map">
                <Option value="16" type="QString" name="House/Bldg"/>
              </Option>
              <Option type="Map">
                <Option value="17" type="QString" name="Boat"/>
              </Option>
              <Option type="Map">
                <Option value="18" type="QString" name="Tenant Specific"/>
              </Option>
              <Option type="Map">
                <Option value="19" type="QString" name="Anthropological"/>
              </Option>
              <Option type="Map">
                <Option value="20" type="QString" name="Road"/>
              </Option>
              <Option type="Map">
                <Option value="21" type="QString" name="Utility"/>
              </Option>
              <Option type="Map">
                <Option value="22" type="QString" name="Access/Easement"/>
              </Option>
              <Option type="Map">
                <Option value="23" type="QString" name="other"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="sid" name=""/>
    <alias index="1" field="id" name=""/>
    <alias index="2" field="map_bk_lot" name=""/>
    <alias index="3" field="job_no" name=""/>
    <alias index="4" field="rev_no" name=""/>
    <alias index="5" field="old_plan_no" name=""/>
    <alias index="6" field="job_type" name=""/>
    <alias index="7" field="job_desc" name=""/>
    <alias index="8" field="folder_name" name=""/>
    <alias index="9" field="client_name" name=""/>
    <alias index="10" field="contact_type" name=""/>
    <alias index="11" field="contact_addr" name=""/>
    <alias index="12" field="locus_addr" name=""/>
    <alias index="13" field="town" name=""/>
    <alias index="14" field="state" name=""/>
    <alias index="15" field="phone_mobile" name=""/>
    <alias index="16" field="phone_work" name=""/>
    <alias index="17" field="phone_home" name=""/>
    <alias index="18" field="primary_contact" name=""/>
    <alias index="19" field="email_primary" name=""/>
    <alias index="20" field="email_secondary" name=""/>
    <alias index="21" field="recorded_by" name=""/>
    <alias index="22" field="planbook_page" name=""/>
    <alias index="23" field="folder_present" name=""/>
    <alias index="24" field="active" name=""/>
    <alias index="25" field="pins_set" name=""/>
    <alias index="26" field="date_recorded" name=""/>
    <alias index="27" field="date_requested" name=""/>
    <alias index="28" field="date_fw_sched" name=""/>
    <alias index="29" field="date_due" name=""/>
    <alias index="30" field="date_estimate_sent" name=""/>
    <alias index="31" field="date_dep" name=""/>
    <alias index="32" field="hrs_rs_est" name=""/>
    <alias index="33" field="hrs_rs_comp" name=""/>
    <alias index="34" field="hrs_fw_est" name=""/>
    <alias index="35" field="hrs_fw_comp" name=""/>
    <alias index="36" field="hrs_cad_est" name=""/>
    <alias index="37" field="hrs_cad_comp" name=""/>
    <alias index="38" field="hrs_misc_est" name=""/>
    <alias index="39" field="hrs_misc_comp" name=""/>
    <alias index="40" field="rate_fw" name=""/>
    <alias index="41" field="rate_cad" name=""/>
    <alias index="42" field="rate_rs" name=""/>
    <alias index="43" field="rate_misc" name=""/>
    <alias index="44" field="amt_fw" name=""/>
    <alias index="45" field="amt_rs" name=""/>
    <alias index="46" field="amt_cad" name=""/>
    <alias index="47" field="amt_misc" name=""/>
    <alias index="48" field="amt_total" name=""/>
    <alias index="49" field="amt_dep" name=""/>
    <alias index="50" field="date_prelim" name=""/>
    <alias index="51" field="date_finalplans" name=""/>
    <alias index="52" field="date_mylar" name=""/>
    <alias index="53" field="date_deeddesc" name=""/>
    <alias index="54" field="date_pins" name=""/>
    <alias index="55" field="date_fw" name=""/>
    <alias index="56" field="date_cad" name=""/>
    <alias index="57" field="copies_prelim" name=""/>
    <alias index="58" field="copies_finalplans" name=""/>
    <alias index="59" field="copies_mylar" name=""/>
    <alias index="60" field="copies_deeddesc" name=""/>
    <alias index="61" field="copies_pins" name=""/>
    <alias index="62" field="copies_fw" name=""/>
    <alias index="63" field="copies_cad" name=""/>
    <alias index="64" field="to_prelim" name=""/>
    <alias index="65" field="to_finalplans" name=""/>
    <alias index="66" field="to_mylar" name=""/>
    <alias index="67" field="to_deeddesc" name=""/>
    <alias index="68" field="to_pins" name=""/>
    <alias index="69" field="to_fw" name=""/>
    <alias index="70" field="to_cad" name=""/>
    <alias index="71" field="date_invoice1" name=""/>
    <alias index="72" field="date_invoice2" name=""/>
    <alias index="73" field="date_invoice3" name=""/>
    <alias index="74" field="amt_invoice1" name=""/>
    <alias index="75" field="amt_invoice2" name=""/>
    <alias index="76" field="amt_invoice3" name=""/>
    <alias index="77" field="lowtide_hrs" name=""/>
    <alias index="78" field="lowtide" name=""/>
    <alias index="79" field="perimeter" name=""/>
    <alias index="80" field="area" name=""/>
    <alias index="81" field="abutters" name=""/>
    <alias index="82" field="objectid" name=""/>
    <alias index="83" field="county" name=""/>
    <alias index="84" field="zipcode" name=""/>
    <alias index="85" field="lat_lon" name=""/>
    <alias index="86" field="sPerimeter" name=""/>
    <alias index="87" field="old_plan" name=""/>
    <alias index="88" field="plan_no" name=""/>
    <alias index="89" field="job" name=""/>
    <alias index="90" field="client_role" name=""/>
    <alias index="91" field="folder_type" name=""/>
    <alias index="92" field="estimate" name=""/>
    <alias index="93" field="objectid3" name=""/>
    <alias index="94" field="objectType" name=""/>
    <alias index="95" field="jobSubtype" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="sid" applyOnUpdate="0"/>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="" field="map_bk_lot" applyOnUpdate="0"/>
    <default expression="" field="job_no" applyOnUpdate="0"/>
    <default expression="" field="rev_no" applyOnUpdate="0"/>
    <default expression="" field="old_plan_no" applyOnUpdate="0"/>
    <default expression="" field="job_type" applyOnUpdate="0"/>
    <default expression="" field="job_desc" applyOnUpdate="0"/>
    <default expression="" field="folder_name" applyOnUpdate="0"/>
    <default expression="" field="client_name" applyOnUpdate="0"/>
    <default expression="" field="contact_type" applyOnUpdate="0"/>
    <default expression="" field="contact_addr" applyOnUpdate="0"/>
    <default expression="" field="locus_addr" applyOnUpdate="0"/>
    <default expression="" field="town" applyOnUpdate="0"/>
    <default expression="ME" field="state" applyOnUpdate="0"/>
    <default expression="" field="phone_mobile" applyOnUpdate="0"/>
    <default expression="" field="phone_work" applyOnUpdate="0"/>
    <default expression="" field="phone_home" applyOnUpdate="0"/>
    <default expression="" field="primary_contact" applyOnUpdate="0"/>
    <default expression="" field="email_primary" applyOnUpdate="0"/>
    <default expression="" field="email_secondary" applyOnUpdate="0"/>
    <default expression="" field="recorded_by" applyOnUpdate="0"/>
    <default expression="" field="planbook_page" applyOnUpdate="0"/>
    <default expression="" field="folder_present" applyOnUpdate="0"/>
    <default expression="" field="active" applyOnUpdate="0"/>
    <default expression="" field="pins_set" applyOnUpdate="0"/>
    <default expression="&#xd;&#xa;'1900-01-01'" field="date_recorded" applyOnUpdate="0"/>
    <default expression="" field="date_requested" applyOnUpdate="0"/>
    <default expression="" field="date_fw_sched" applyOnUpdate="0"/>
    <default expression="" field="date_due" applyOnUpdate="0"/>
    <default expression="" field="date_estimate_sent" applyOnUpdate="0"/>
    <default expression="" field="date_dep" applyOnUpdate="0"/>
    <default expression="" field="hrs_rs_est" applyOnUpdate="0"/>
    <default expression="" field="hrs_rs_comp" applyOnUpdate="0"/>
    <default expression="" field="hrs_fw_est" applyOnUpdate="0"/>
    <default expression="" field="hrs_fw_comp" applyOnUpdate="0"/>
    <default expression="" field="hrs_cad_est" applyOnUpdate="0"/>
    <default expression="" field="hrs_cad_comp" applyOnUpdate="0"/>
    <default expression="" field="hrs_misc_est" applyOnUpdate="0"/>
    <default expression="" field="hrs_misc_comp" applyOnUpdate="0"/>
    <default expression="" field="rate_fw" applyOnUpdate="0"/>
    <default expression="" field="rate_cad" applyOnUpdate="0"/>
    <default expression="" field="rate_rs" applyOnUpdate="0"/>
    <default expression="" field="rate_misc" applyOnUpdate="0"/>
    <default expression="" field="amt_fw" applyOnUpdate="0"/>
    <default expression="" field="amt_rs" applyOnUpdate="0"/>
    <default expression="" field="amt_cad" applyOnUpdate="0"/>
    <default expression="" field="amt_misc" applyOnUpdate="0"/>
    <default expression="" field="amt_total" applyOnUpdate="0"/>
    <default expression="" field="amt_dep" applyOnUpdate="0"/>
    <default expression="" field="date_prelim" applyOnUpdate="0"/>
    <default expression="" field="date_finalplans" applyOnUpdate="0"/>
    <default expression="" field="date_mylar" applyOnUpdate="0"/>
    <default expression="" field="date_deeddesc" applyOnUpdate="0"/>
    <default expression="" field="date_pins" applyOnUpdate="0"/>
    <default expression="" field="date_fw" applyOnUpdate="0"/>
    <default expression="" field="date_cad" applyOnUpdate="0"/>
    <default expression="" field="copies_prelim" applyOnUpdate="0"/>
    <default expression="" field="copies_finalplans" applyOnUpdate="0"/>
    <default expression="" field="copies_mylar" applyOnUpdate="0"/>
    <default expression="" field="copies_deeddesc" applyOnUpdate="0"/>
    <default expression="" field="copies_pins" applyOnUpdate="0"/>
    <default expression="" field="copies_fw" applyOnUpdate="0"/>
    <default expression="" field="copies_cad" applyOnUpdate="0"/>
    <default expression="" field="to_prelim" applyOnUpdate="0"/>
    <default expression="" field="to_finalplans" applyOnUpdate="0"/>
    <default expression="" field="to_mylar" applyOnUpdate="0"/>
    <default expression="" field="to_deeddesc" applyOnUpdate="0"/>
    <default expression="" field="to_pins" applyOnUpdate="0"/>
    <default expression="" field="to_fw" applyOnUpdate="0"/>
    <default expression="" field="to_cad" applyOnUpdate="0"/>
    <default expression="" field="date_invoice1" applyOnUpdate="0"/>
    <default expression="" field="date_invoice2" applyOnUpdate="0"/>
    <default expression="" field="date_invoice3" applyOnUpdate="0"/>
    <default expression="" field="amt_invoice1" applyOnUpdate="0"/>
    <default expression="" field="amt_invoice2" applyOnUpdate="0"/>
    <default expression="" field="amt_invoice3" applyOnUpdate="0"/>
    <default expression="" field="lowtide_hrs" applyOnUpdate="0"/>
    <default expression="" field="lowtide" applyOnUpdate="0"/>
    <default expression="$perimeter" field="perimeter" applyOnUpdate="1"/>
    <default expression="($area * 0.000247105)" field="area" applyOnUpdate="0"/>
    <default expression="" field="abutters" applyOnUpdate="0"/>
    <default expression="" field="objectid" applyOnUpdate="0"/>
    <default expression="" field="county" applyOnUpdate="0"/>
    <default expression="" field="zipcode" applyOnUpdate="0"/>
    <default expression="y(transform($geometry,  layer_property( 'brs_jobs', 'crs'), 'EPSG:4326')) || ',' || x(transform($geometry,  layer_property( 'brs_jobs', 'crs'), 'EPSG:4326'))" field="lat_lon" applyOnUpdate="0"/>
    <default expression="format_number($perimeter * 3.28084,0)" field="sPerimeter" applyOnUpdate="1"/>
    <default expression="" field="old_plan" applyOnUpdate="0"/>
    <default expression="" field="plan_no" applyOnUpdate="0"/>
    <default expression="" field="job" applyOnUpdate="0"/>
    <default expression="" field="client_role" applyOnUpdate="0"/>
    <default expression="" field="folder_type" applyOnUpdate="0"/>
    <default expression="" field="estimate" applyOnUpdate="0"/>
    <default expression="" field="objectid3" applyOnUpdate="0"/>
    <default expression="" field="objectType" applyOnUpdate="0"/>
    <default expression="" field="jobSubtype" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" unique_strength="1" field="sid" constraints="3" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="id" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="map_bk_lot" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="job_no" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="rev_no" constraints="4" exp_strength="2"/>
    <constraint notnull_strength="0" unique_strength="0" field="old_plan_no" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="job_type" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="job_desc" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="folder_name" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="client_name" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="contact_type" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="contact_addr" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="locus_addr" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="town" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="1" unique_strength="0" field="state" constraints="1" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="phone_mobile" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="phone_work" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="phone_home" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="primary_contact" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="email_primary" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="email_secondary" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="recorded_by" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="planbook_page" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="folder_present" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="active" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="pins_set" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_recorded" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_requested" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_fw_sched" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_due" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_estimate_sent" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_dep" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_rs_est" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_rs_comp" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_fw_est" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_fw_comp" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_cad_est" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_cad_comp" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_misc_est" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="hrs_misc_comp" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="rate_fw" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="rate_cad" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="rate_rs" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="rate_misc" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_fw" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_rs" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_cad" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_misc" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_total" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_dep" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_prelim" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_finalplans" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_mylar" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_deeddesc" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_pins" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_fw" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_cad" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_prelim" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_finalplans" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_mylar" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_deeddesc" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_pins" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_fw" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="copies_cad" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_prelim" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_finalplans" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_mylar" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_deeddesc" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_pins" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_fw" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="to_cad" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_invoice1" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_invoice2" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="date_invoice3" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_invoice1" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_invoice2" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="amt_invoice3" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="lowtide_hrs" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="lowtide" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="perimeter" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="area" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="abutters" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="objectid" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="county" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="zipcode" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="lat_lon" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="sPerimeter" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="old_plan" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="plan_no" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="job" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="client_role" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="folder_type" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="estimate" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="objectid3" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="objectType" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" unique_strength="0" field="jobSubtype" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="sid" exp=""/>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="map_bk_lot" exp=""/>
    <constraint desc="" field="job_no" exp=""/>
    <constraint desc="" field="rev_no" exp="CASE WHEN   &quot;rev_no&quot;  IS NULL THEN '' ELSE   &quot;rev_no&quot;  &#xd;&#xa;END"/>
    <constraint desc="" field="old_plan_no" exp=""/>
    <constraint desc="" field="job_type" exp=""/>
    <constraint desc="" field="job_desc" exp=""/>
    <constraint desc="" field="folder_name" exp=""/>
    <constraint desc="" field="client_name" exp=""/>
    <constraint desc="" field="contact_type" exp=""/>
    <constraint desc="" field="contact_addr" exp=""/>
    <constraint desc="" field="locus_addr" exp=""/>
    <constraint desc="" field="town" exp=""/>
    <constraint desc="" field="state" exp=""/>
    <constraint desc="" field="phone_mobile" exp=""/>
    <constraint desc="" field="phone_work" exp=""/>
    <constraint desc="" field="phone_home" exp=""/>
    <constraint desc="" field="primary_contact" exp=""/>
    <constraint desc="" field="email_primary" exp=""/>
    <constraint desc="" field="email_secondary" exp=""/>
    <constraint desc="" field="recorded_by" exp=""/>
    <constraint desc="" field="planbook_page" exp=""/>
    <constraint desc="" field="folder_present" exp=""/>
    <constraint desc="" field="active" exp=""/>
    <constraint desc="" field="pins_set" exp=""/>
    <constraint desc="" field="date_recorded" exp=""/>
    <constraint desc="" field="date_requested" exp=""/>
    <constraint desc="" field="date_fw_sched" exp=""/>
    <constraint desc="" field="date_due" exp=""/>
    <constraint desc="" field="date_estimate_sent" exp=""/>
    <constraint desc="" field="date_dep" exp=""/>
    <constraint desc="" field="hrs_rs_est" exp=""/>
    <constraint desc="" field="hrs_rs_comp" exp=""/>
    <constraint desc="" field="hrs_fw_est" exp=""/>
    <constraint desc="" field="hrs_fw_comp" exp=""/>
    <constraint desc="" field="hrs_cad_est" exp=""/>
    <constraint desc="" field="hrs_cad_comp" exp=""/>
    <constraint desc="" field="hrs_misc_est" exp=""/>
    <constraint desc="" field="hrs_misc_comp" exp=""/>
    <constraint desc="" field="rate_fw" exp=""/>
    <constraint desc="" field="rate_cad" exp=""/>
    <constraint desc="" field="rate_rs" exp=""/>
    <constraint desc="" field="rate_misc" exp=""/>
    <constraint desc="" field="amt_fw" exp=""/>
    <constraint desc="" field="amt_rs" exp=""/>
    <constraint desc="" field="amt_cad" exp=""/>
    <constraint desc="" field="amt_misc" exp=""/>
    <constraint desc="" field="amt_total" exp=""/>
    <constraint desc="" field="amt_dep" exp=""/>
    <constraint desc="" field="date_prelim" exp=""/>
    <constraint desc="" field="date_finalplans" exp=""/>
    <constraint desc="" field="date_mylar" exp=""/>
    <constraint desc="" field="date_deeddesc" exp=""/>
    <constraint desc="" field="date_pins" exp=""/>
    <constraint desc="" field="date_fw" exp=""/>
    <constraint desc="" field="date_cad" exp=""/>
    <constraint desc="" field="copies_prelim" exp=""/>
    <constraint desc="" field="copies_finalplans" exp=""/>
    <constraint desc="" field="copies_mylar" exp=""/>
    <constraint desc="" field="copies_deeddesc" exp=""/>
    <constraint desc="" field="copies_pins" exp=""/>
    <constraint desc="" field="copies_fw" exp=""/>
    <constraint desc="" field="copies_cad" exp=""/>
    <constraint desc="" field="to_prelim" exp=""/>
    <constraint desc="" field="to_finalplans" exp=""/>
    <constraint desc="" field="to_mylar" exp=""/>
    <constraint desc="" field="to_deeddesc" exp=""/>
    <constraint desc="" field="to_pins" exp=""/>
    <constraint desc="" field="to_fw" exp=""/>
    <constraint desc="" field="to_cad" exp=""/>
    <constraint desc="" field="date_invoice1" exp=""/>
    <constraint desc="" field="date_invoice2" exp=""/>
    <constraint desc="" field="date_invoice3" exp=""/>
    <constraint desc="" field="amt_invoice1" exp=""/>
    <constraint desc="" field="amt_invoice2" exp=""/>
    <constraint desc="" field="amt_invoice3" exp=""/>
    <constraint desc="" field="lowtide_hrs" exp=""/>
    <constraint desc="" field="lowtide" exp=""/>
    <constraint desc="" field="perimeter" exp=""/>
    <constraint desc="" field="area" exp=""/>
    <constraint desc="" field="abutters" exp=""/>
    <constraint desc="" field="objectid" exp=""/>
    <constraint desc="" field="county" exp=""/>
    <constraint desc="" field="zipcode" exp=""/>
    <constraint desc="" field="lat_lon" exp=""/>
    <constraint desc="" field="sPerimeter" exp=""/>
    <constraint desc="" field="old_plan" exp=""/>
    <constraint desc="" field="plan_no" exp=""/>
    <constraint desc="" field="job" exp=""/>
    <constraint desc="" field="client_role" exp=""/>
    <constraint desc="" field="folder_type" exp=""/>
    <constraint desc="" field="estimate" exp=""/>
    <constraint desc="" field="objectid3" exp=""/>
    <constraint desc="" field="objectType" exp=""/>
    <constraint desc="" field="jobSubtype" exp=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="1" sortExpression="&quot;sid&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column hidden="0" width="-1" type="field" name="sid"/>
      <column hidden="0" width="-1" type="field" name="map_bk_lot"/>
      <column hidden="0" width="-1" type="field" name="job_no"/>
      <column hidden="0" width="-1" type="field" name="objectid"/>
      <column hidden="0" width="-1" type="field" name="id"/>
      <column hidden="0" width="-1" type="field" name="rev_no"/>
      <column hidden="0" width="-1" type="field" name="old_plan_no"/>
      <column hidden="0" width="-1" type="field" name="job_type"/>
      <column hidden="0" width="-1" type="field" name="job_desc"/>
      <column hidden="0" width="-1" type="field" name="folder_name"/>
      <column hidden="0" width="-1" type="field" name="client_name"/>
      <column hidden="0" width="-1" type="field" name="contact_type"/>
      <column hidden="0" width="-1" type="field" name="contact_addr"/>
      <column hidden="0" width="-1" type="field" name="locus_addr"/>
      <column hidden="0" width="-1" type="field" name="town"/>
      <column hidden="0" width="-1" type="field" name="state"/>
      <column hidden="0" width="-1" type="field" name="phone_mobile"/>
      <column hidden="0" width="-1" type="field" name="phone_work"/>
      <column hidden="0" width="-1" type="field" name="phone_home"/>
      <column hidden="0" width="-1" type="field" name="primary_contact"/>
      <column hidden="0" width="-1" type="field" name="email_primary"/>
      <column hidden="0" width="-1" type="field" name="email_secondary"/>
      <column hidden="0" width="-1" type="field" name="recorded_by"/>
      <column hidden="0" width="-1" type="field" name="planbook_page"/>
      <column hidden="0" width="-1" type="field" name="folder_present"/>
      <column hidden="0" width="-1" type="field" name="active"/>
      <column hidden="0" width="-1" type="field" name="pins_set"/>
      <column hidden="0" width="-1" type="field" name="date_recorded"/>
      <column hidden="0" width="-1" type="field" name="date_requested"/>
      <column hidden="0" width="-1" type="field" name="date_fw_sched"/>
      <column hidden="0" width="-1" type="field" name="date_due"/>
      <column hidden="0" width="-1" type="field" name="date_estimate_sent"/>
      <column hidden="0" width="-1" type="field" name="date_dep"/>
      <column hidden="0" width="-1" type="field" name="hrs_rs_est"/>
      <column hidden="0" width="-1" type="field" name="hrs_rs_comp"/>
      <column hidden="0" width="-1" type="field" name="hrs_fw_est"/>
      <column hidden="0" width="-1" type="field" name="hrs_fw_comp"/>
      <column hidden="0" width="-1" type="field" name="hrs_cad_est"/>
      <column hidden="0" width="-1" type="field" name="hrs_cad_comp"/>
      <column hidden="0" width="-1" type="field" name="hrs_misc_est"/>
      <column hidden="0" width="-1" type="field" name="hrs_misc_comp"/>
      <column hidden="0" width="-1" type="field" name="rate_fw"/>
      <column hidden="0" width="-1" type="field" name="rate_cad"/>
      <column hidden="0" width="-1" type="field" name="rate_rs"/>
      <column hidden="0" width="-1" type="field" name="rate_misc"/>
      <column hidden="0" width="-1" type="field" name="amt_fw"/>
      <column hidden="0" width="-1" type="field" name="amt_rs"/>
      <column hidden="0" width="-1" type="field" name="amt_cad"/>
      <column hidden="0" width="-1" type="field" name="amt_misc"/>
      <column hidden="0" width="-1" type="field" name="amt_total"/>
      <column hidden="0" width="-1" type="field" name="amt_dep"/>
      <column hidden="0" width="-1" type="field" name="date_prelim"/>
      <column hidden="0" width="-1" type="field" name="date_finalplans"/>
      <column hidden="0" width="-1" type="field" name="date_mylar"/>
      <column hidden="0" width="-1" type="field" name="date_deeddesc"/>
      <column hidden="0" width="-1" type="field" name="date_pins"/>
      <column hidden="0" width="-1" type="field" name="date_fw"/>
      <column hidden="0" width="-1" type="field" name="date_cad"/>
      <column hidden="0" width="-1" type="field" name="copies_prelim"/>
      <column hidden="0" width="-1" type="field" name="copies_finalplans"/>
      <column hidden="0" width="-1" type="field" name="copies_mylar"/>
      <column hidden="0" width="-1" type="field" name="copies_deeddesc"/>
      <column hidden="0" width="-1" type="field" name="copies_pins"/>
      <column hidden="0" width="-1" type="field" name="copies_fw"/>
      <column hidden="0" width="-1" type="field" name="copies_cad"/>
      <column hidden="0" width="-1" type="field" name="to_prelim"/>
      <column hidden="0" width="-1" type="field" name="to_finalplans"/>
      <column hidden="0" width="-1" type="field" name="to_mylar"/>
      <column hidden="0" width="-1" type="field" name="to_deeddesc"/>
      <column hidden="0" width="-1" type="field" name="to_pins"/>
      <column hidden="0" width="-1" type="field" name="to_fw"/>
      <column hidden="0" width="-1" type="field" name="to_cad"/>
      <column hidden="0" width="-1" type="field" name="date_invoice1"/>
      <column hidden="0" width="-1" type="field" name="date_invoice2"/>
      <column hidden="0" width="-1" type="field" name="date_invoice3"/>
      <column hidden="0" width="-1" type="field" name="amt_invoice1"/>
      <column hidden="0" width="-1" type="field" name="amt_invoice2"/>
      <column hidden="0" width="-1" type="field" name="amt_invoice3"/>
      <column hidden="0" width="-1" type="field" name="lowtide_hrs"/>
      <column hidden="0" width="-1" type="field" name="lowtide"/>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" width="-1" type="field" name="area"/>
      <column hidden="0" width="-1" type="field" name="perimeter"/>
      <column hidden="0" width="-1" type="field" name="abutters"/>
      <column hidden="0" width="-1" type="field" name="county"/>
      <column hidden="0" width="-1" type="field" name="zipcode"/>
      <column hidden="0" width="-1" type="field" name="lat_lon"/>
      <column hidden="0" width="-1" type="field" name="sPerimeter"/>
      <column hidden="0" width="-1" type="field" name="old_plan"/>
      <column hidden="0" width="-1" type="field" name="plan_no"/>
      <column hidden="0" width="-1" type="field" name="job"/>
      <column hidden="0" width="-1" type="field" name="client_role"/>
      <column hidden="0" width="-1" type="field" name="folder_type"/>
      <column hidden="0" width="-1" type="field" name="estimate"/>
      <column hidden="0" width="-1" type="field" name="jobSubtype"/>
      <column hidden="0" width="-1" type="field" name="objectType"/>
      <column hidden="0" width="-1" type="field" name="objectid3"/>
    </columns>
  </attributetableconfig>
  <editform tolerant="1">Z:\0 - Settings\GIS\QGIS\plugins\profiles\DEV\python\plugins\brsgis_plugin\UI\brs_jobs.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:\0 - Settings\GIS\QGIS\plugins\profiles\DEV\python\plugins\brsgis_plugin\UI\brs_jobs_init.py</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>1</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field name="abutters" editable="1"/>
    <field name="active" editable="1"/>
    <field name="amt_cad" editable="1"/>
    <field name="amt_dep" editable="1"/>
    <field name="amt_fw" editable="1"/>
    <field name="amt_invoice1" editable="1"/>
    <field name="amt_invoice2" editable="1"/>
    <field name="amt_invoice3" editable="1"/>
    <field name="amt_misc" editable="1"/>
    <field name="amt_rs" editable="1"/>
    <field name="amt_total" editable="1"/>
    <field name="area" editable="1"/>
    <field name="centroidxy" editable="1"/>
    <field name="client_name" editable="0"/>
    <field name="client_role" editable="1"/>
    <field name="contact_addr" editable="1"/>
    <field name="contact_type" editable="1"/>
    <field name="copies_cad" editable="1"/>
    <field name="copies_deeddesc" editable="1"/>
    <field name="copies_finalplans" editable="1"/>
    <field name="copies_fw" editable="1"/>
    <field name="copies_mylar" editable="1"/>
    <field name="copies_pins" editable="1"/>
    <field name="copies_prelim" editable="1"/>
    <field name="county" editable="0"/>
    <field name="date_cad" editable="1"/>
    <field name="date_deeddesc" editable="1"/>
    <field name="date_dep" editable="1"/>
    <field name="date_due" editable="1"/>
    <field name="date_estimate_sent" editable="1"/>
    <field name="date_finalplans" editable="1"/>
    <field name="date_fw" editable="1"/>
    <field name="date_fw_sched" editable="1"/>
    <field name="date_invoice1" editable="1"/>
    <field name="date_invoice2" editable="1"/>
    <field name="date_invoice3" editable="1"/>
    <field name="date_mylar" editable="1"/>
    <field name="date_pins" editable="1"/>
    <field name="date_prelim" editable="1"/>
    <field name="date_recorded" editable="1"/>
    <field name="date_requested" editable="1"/>
    <field name="email_primary" editable="1"/>
    <field name="email_secondary" editable="1"/>
    <field name="estimate" editable="1"/>
    <field name="featureType" editable="1"/>
    <field name="folder_name" editable="0"/>
    <field name="folder_present" editable="1"/>
    <field name="folder_type" editable="1"/>
    <field name="hrs_cad_comp" editable="1"/>
    <field name="hrs_cad_est" editable="1"/>
    <field name="hrs_fw_comp" editable="1"/>
    <field name="hrs_fw_est" editable="1"/>
    <field name="hrs_misc_comp" editable="1"/>
    <field name="hrs_misc_est" editable="1"/>
    <field name="hrs_rs_comp" editable="1"/>
    <field name="hrs_rs_est" editable="1"/>
    <field name="id" editable="1"/>
    <field name="job" editable="1"/>
    <field name="jobSubtype" editable="1"/>
    <field name="jobType" editable="1"/>
    <field name="job_desc" editable="1"/>
    <field name="job_no" editable="0"/>
    <field name="job_subtype" editable="1"/>
    <field name="job_type" editable="1"/>
    <field name="lat_lon" editable="0"/>
    <field name="locus_addr" editable="1"/>
    <field name="lowtide" editable="1"/>
    <field name="lowtide_hrs" editable="1"/>
    <field name="map_bk_lot" editable="0"/>
    <field name="objectType" editable="1"/>
    <field name="objectid" editable="1"/>
    <field name="objectid3" editable="1"/>
    <field name="old_plan" editable="1"/>
    <field name="old_plan_no" editable="1"/>
    <field name="perimeter" editable="1"/>
    <field name="phone_home" editable="1"/>
    <field name="phone_mobile" editable="1"/>
    <field name="phone_work" editable="1"/>
    <field name="pins_set" editable="1"/>
    <field name="plan_no" editable="1"/>
    <field name="planbook_page" editable="1"/>
    <field name="primary_contact" editable="1"/>
    <field name="rate_cad" editable="1"/>
    <field name="rate_fw" editable="1"/>
    <field name="rate_misc" editable="1"/>
    <field name="rate_rs" editable="1"/>
    <field name="recorded_by" editable="1"/>
    <field name="rev_no" editable="1"/>
    <field name="sPerimeter" editable="1"/>
    <field name="sid" editable="1"/>
    <field name="state" editable="1"/>
    <field name="to_cad" editable="1"/>
    <field name="to_deeddesc" editable="1"/>
    <field name="to_finalplans" editable="1"/>
    <field name="to_fw" editable="1"/>
    <field name="to_mylar" editable="1"/>
    <field name="to_pins" editable="1"/>
    <field name="to_prelim" editable="1"/>
    <field name="town" editable="1"/>
    <field name="zip" editable="1"/>
    <field name="zipcode" editable="0"/>
  </editable>
  <labelOnTop>
    <field name="abutters" labelOnTop="0"/>
    <field name="active" labelOnTop="0"/>
    <field name="amt_cad" labelOnTop="0"/>
    <field name="amt_dep" labelOnTop="0"/>
    <field name="amt_fw" labelOnTop="0"/>
    <field name="amt_invoice1" labelOnTop="0"/>
    <field name="amt_invoice2" labelOnTop="0"/>
    <field name="amt_invoice3" labelOnTop="0"/>
    <field name="amt_misc" labelOnTop="0"/>
    <field name="amt_rs" labelOnTop="0"/>
    <field name="amt_total" labelOnTop="0"/>
    <field name="area" labelOnTop="0"/>
    <field name="centroidxy" labelOnTop="0"/>
    <field name="client_name" labelOnTop="0"/>
    <field name="client_role" labelOnTop="0"/>
    <field name="contact_addr" labelOnTop="0"/>
    <field name="contact_type" labelOnTop="0"/>
    <field name="copies_cad" labelOnTop="0"/>
    <field name="copies_deeddesc" labelOnTop="0"/>
    <field name="copies_finalplans" labelOnTop="0"/>
    <field name="copies_fw" labelOnTop="0"/>
    <field name="copies_mylar" labelOnTop="0"/>
    <field name="copies_pins" labelOnTop="0"/>
    <field name="copies_prelim" labelOnTop="0"/>
    <field name="county" labelOnTop="0"/>
    <field name="date_cad" labelOnTop="0"/>
    <field name="date_deeddesc" labelOnTop="0"/>
    <field name="date_dep" labelOnTop="0"/>
    <field name="date_due" labelOnTop="0"/>
    <field name="date_estimate_sent" labelOnTop="0"/>
    <field name="date_finalplans" labelOnTop="0"/>
    <field name="date_fw" labelOnTop="0"/>
    <field name="date_fw_sched" labelOnTop="0"/>
    <field name="date_invoice1" labelOnTop="0"/>
    <field name="date_invoice2" labelOnTop="0"/>
    <field name="date_invoice3" labelOnTop="0"/>
    <field name="date_mylar" labelOnTop="0"/>
    <field name="date_pins" labelOnTop="0"/>
    <field name="date_prelim" labelOnTop="0"/>
    <field name="date_recorded" labelOnTop="0"/>
    <field name="date_requested" labelOnTop="0"/>
    <field name="email_primary" labelOnTop="0"/>
    <field name="email_secondary" labelOnTop="0"/>
    <field name="estimate" labelOnTop="0"/>
    <field name="featureType" labelOnTop="0"/>
    <field name="folder_name" labelOnTop="0"/>
    <field name="folder_present" labelOnTop="0"/>
    <field name="folder_type" labelOnTop="0"/>
    <field name="hrs_cad_comp" labelOnTop="0"/>
    <field name="hrs_cad_est" labelOnTop="0"/>
    <field name="hrs_fw_comp" labelOnTop="0"/>
    <field name="hrs_fw_est" labelOnTop="0"/>
    <field name="hrs_misc_comp" labelOnTop="0"/>
    <field name="hrs_misc_est" labelOnTop="0"/>
    <field name="hrs_rs_comp" labelOnTop="0"/>
    <field name="hrs_rs_est" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="job" labelOnTop="0"/>
    <field name="jobSubtype" labelOnTop="0"/>
    <field name="jobType" labelOnTop="0"/>
    <field name="job_desc" labelOnTop="0"/>
    <field name="job_no" labelOnTop="0"/>
    <field name="job_subtype" labelOnTop="0"/>
    <field name="job_type" labelOnTop="0"/>
    <field name="lat_lon" labelOnTop="0"/>
    <field name="locus_addr" labelOnTop="0"/>
    <field name="lowtide" labelOnTop="0"/>
    <field name="lowtide_hrs" labelOnTop="0"/>
    <field name="map_bk_lot" labelOnTop="0"/>
    <field name="objectType" labelOnTop="0"/>
    <field name="objectid" labelOnTop="0"/>
    <field name="objectid3" labelOnTop="0"/>
    <field name="old_plan" labelOnTop="0"/>
    <field name="old_plan_no" labelOnTop="0"/>
    <field name="perimeter" labelOnTop="0"/>
    <field name="phone_home" labelOnTop="0"/>
    <field name="phone_mobile" labelOnTop="0"/>
    <field name="phone_work" labelOnTop="0"/>
    <field name="pins_set" labelOnTop="0"/>
    <field name="plan_no" labelOnTop="0"/>
    <field name="planbook_page" labelOnTop="0"/>
    <field name="primary_contact" labelOnTop="0"/>
    <field name="rate_cad" labelOnTop="0"/>
    <field name="rate_fw" labelOnTop="0"/>
    <field name="rate_misc" labelOnTop="0"/>
    <field name="rate_rs" labelOnTop="0"/>
    <field name="recorded_by" labelOnTop="0"/>
    <field name="rev_no" labelOnTop="0"/>
    <field name="sPerimeter" labelOnTop="0"/>
    <field name="sid" labelOnTop="0"/>
    <field name="state" labelOnTop="0"/>
    <field name="to_cad" labelOnTop="0"/>
    <field name="to_deeddesc" labelOnTop="0"/>
    <field name="to_finalplans" labelOnTop="0"/>
    <field name="to_fw" labelOnTop="0"/>
    <field name="to_mylar" labelOnTop="0"/>
    <field name="to_pins" labelOnTop="0"/>
    <field name="to_prelim" labelOnTop="0"/>
    <field name="town" labelOnTop="0"/>
    <field name="zip" labelOnTop="0"/>
    <field name="zipcode" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="fk_jobs_contacts">
      <config type="Map">
        <Option value="" type="QString" name="nm-rel"/>
      </config>
    </widget>
  </widgets>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>job_no</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
