<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" labelsEnabled="1" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0" version="3.0.2-Girona" simplifyDrawingTol="1" maxScale="0" simplifyLocal="1" simplifyMaxScale="1">
  <renderer-v2 forceraster="0" type="singleSymbol" symbollevels="0" enableorderby="1">
    <symbols>
      <symbol alpha="1" type="fill" clip_to_extent="1" name="0">
        <layer pass="0" class="SimpleFill" locked="0" enabled="1">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="127,237,127,255" k="color"/>
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
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
    <orderby>
      <orderByClause asc="1" nullsFirst="0">'brs_jobs_9578185e_0c06_48ea_ab6c_2575ee52f68e'</orderByClause>
      <orderByClause asc="1" nullsFirst="0">'abutters_a7752f9f_2bd3_4bbd_b554_a095bde80b82'</orderByClause>
    </orderby>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{49304889-b8be-47e7-b8b4-7ab690435b10}">
      <rule key="{d4061e7d-8398-41d3-bbc4-0aad34b471c8}" description="label" scalemindenom="1" scalemaxdenom="7500">
        <settings>
          <text-style blendMode="0" fontSize="8.25" fieldName="job_no" useSubstitutions="0" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontCapitals="0" isExpression="0" fontFamily="MS Shell Dlg 2" fontItalic="0" fontSizeUnit="Point" fontStrikeout="0" textOpacity="1" previewBkgrdColor="#ffffff" fontUnderline="0" fontWordSpacing="0" fontWeight="50" textColor="0,0,0,255" fontLetterSpacing="0" namedStyle="Normal">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferNoFill="0" bufferColor="255,255,255,255" bufferSizeUnits="MM" bufferSize="1" bufferJoinStyle="128" bufferDraw="0" bufferOpacity="1"/>
            <background shapeRadiiX="0" shapeOpacity="1" shapeBorderColor="128,128,128,255" shapeBorderWidthUnit="MM" shapeOffsetX="0" shapeSizeUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeRotationType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeType="0" shapeOffsetY="0" shapeSizeType="0" shapeFillColor="255,255,255,255" shapeRotation="0" shapeSizeY="0" shapeSizeX="0" shapeDraw="0" shapeRadiiUnit="MM" shapeBlendMode="0" shapeBorderWidth="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeSVGFile=""/>
            <shadow shadowRadiusAlphaOnly="0" shadowBlendMode="6" shadowRadiusUnit="MM" shadowDraw="0" shadowColor="0,0,0,255" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowRadius="1.5" shadowScale="100" shadowOpacity="0.7" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetDist="1" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0"/>
            <substitutions/>
          </text-style>
          <text-format decimals="3" formatNumbers="0" multilineAlign="4294967295" rightDirectionSymbol=">" wrapChar="" addDirectionSymbol="0" plussign="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" placeDirectionSymbol="0"/>
          <placement xOffset="0" repeatDistanceUnits="MM" maxCurvedCharAngleOut="-25" centroidWhole="0" distUnits="MM" quadOffset="4" preserveRotation="1" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleIn="25" priority="5" rotationAngle="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistance="0" offsetUnits="MapUnit" centroidInside="0" distMapUnitScale="3x:0,0,0,0,0,0" placement="0" yOffset="0" fitInPolygonOnly="0" placementFlags="10" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetType="0"/>
          <rendering mergeLines="0" scaleMax="10000000" labelPerPart="0" fontLimitPixelSize="0" limitNumLabels="0" obstacle="1" obstacleType="0" fontMinPixelSize="3" displayAll="0" fontMaxPixelSize="10000" scaleVisibility="0" upsidedownLabels="0" drawLabels="1" obstacleFactor="1" scaleMin="1" maxNumLabels="2000" minFeatureSize="0" zIndex="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>COALESCE( "folder_name", '&lt;NULL>' )</value>
      <value>COALESCE( "folder_name", '&lt;NULL>' )</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>6</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="0" scaleBasedVisibility="0" penWidth="0" labelPlacementMethod="XHeight" minimumSize="0" backgroundAlpha="255" diagramOrientation="Up" penColor="#000000" sizeScale="3x:0,0,0,0,0,0" enabled="0" sizeType="MM" maxScaleDenominator="1e+8" barWidth="5" backgroundColor="#ffffff" scaleDependency="Area" width="15" lineSizeScale="3x:0,0,0,0,0,0" height="15" penAlpha="255" rotationOffset="270" lineSizeType="MM" opacity="1">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="2" showAll="1" zIndex="0" dist="0" placement="0" obstacle="0" priority="0">
    <properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="sid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="map_bk_lot">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rev_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="old_plan_no">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="Map" name="map">
              <Option type="QString" value="BRS" name="BRS"/>
              <Option type="QString" value="BRSDP" name="BRSDP"/>
              <Option type="QString" value="FEMA" name="FEMA"/>
              <Option type="QString" value="MIS" name="MIS"/>
              <Option type="QString" value="OTHER" name="OTHER"/>
              <Option type="QString" value="RESEARCH" name="RESEARCH"/>
              <Option type="QString" value="SDP" name="SDP"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="job_desc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder_name">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="Map" name="map">
              <Option type="QString" value="Attorney" name="Attorney"/>
              <Option type="QString" value="Banker" name="Banker"/>
              <Option type="QString" value="Builder" name="Builder"/>
              <Option type="QString" value="Buyer" name="Buyer"/>
              <Option type="QString" value="Leaseholder" name="Leaseholder"/>
              <Option type="QString" value="Other" name="Other"/>
              <Option type="QString" value="Owner" name="Owner"/>
              <Option type="QString" value="Realtor" name="Realtor"/>
              <Option type="QString" value="Seller" name="Seller"/>
              <Option type="QString" value="Surveyor" name="Surveyor"/>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="client_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_addr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="locus_addr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="town">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="state">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_mobile">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_work">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_home">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="primary_contact">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_primary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_secondary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="recorded_by">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="planbook_page">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder_present">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="active">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="pins_set">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="Map" name="map">
              <Option type="QString" value="N/A" name="N/A"/>
              <Option type="QString" value="NO" name="NO"/>
              <Option type="QString" value="YES" name="YES"/>
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
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_rs_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_fw_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_fw_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_cad_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_cad_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_misc_est">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="hrs_misc_comp">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_rs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rate_misc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_rs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_misc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_total">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_dep">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
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
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_finalplans">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_mylar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_deeddesc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_pins">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="copies_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_prelim">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_finalplans">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_mylar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_deeddesc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_pins">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_fw">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="to_cad">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
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
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_invoice2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="amt_invoice3">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lowtide_hrs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lowtide">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="perimeter">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="area">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="abutters">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="objectid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="county">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="zipcode">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="lat_lon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
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
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="sid"/>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="map_bk_lot"/>
    <default expression="" applyOnUpdate="0" field="job_no"/>
    <default expression="" applyOnUpdate="0" field="rev_no"/>
    <default expression="" applyOnUpdate="0" field="old_plan_no"/>
    <default expression="" applyOnUpdate="0" field="job_type"/>
    <default expression="" applyOnUpdate="0" field="job_desc"/>
    <default expression="" applyOnUpdate="0" field="folder_name"/>
    <default expression="" applyOnUpdate="0" field="client_name"/>
    <default expression="" applyOnUpdate="0" field="contact_type"/>
    <default expression="" applyOnUpdate="0" field="contact_addr"/>
    <default expression="" applyOnUpdate="0" field="locus_addr"/>
    <default expression="" applyOnUpdate="0" field="town"/>
    <default expression="ME" applyOnUpdate="0" field="state"/>
    <default expression="" applyOnUpdate="0" field="phone_mobile"/>
    <default expression="" applyOnUpdate="0" field="phone_work"/>
    <default expression="" applyOnUpdate="0" field="phone_home"/>
    <default expression="" applyOnUpdate="0" field="primary_contact"/>
    <default expression="" applyOnUpdate="0" field="email_primary"/>
    <default expression="" applyOnUpdate="0" field="email_secondary"/>
    <default expression="" applyOnUpdate="0" field="recorded_by"/>
    <default expression="" applyOnUpdate="0" field="planbook_page"/>
    <default expression="" applyOnUpdate="0" field="folder_present"/>
    <default expression="" applyOnUpdate="0" field="active"/>
    <default expression="" applyOnUpdate="0" field="pins_set"/>
    <default expression="&#xd;&#xa;'1900-01-01'" applyOnUpdate="0" field="date_recorded"/>
    <default expression="" applyOnUpdate="0" field="date_requested"/>
    <default expression="" applyOnUpdate="0" field="date_fw_sched"/>
    <default expression="" applyOnUpdate="0" field="date_due"/>
    <default expression="" applyOnUpdate="0" field="date_estimate_sent"/>
    <default expression="" applyOnUpdate="0" field="date_dep"/>
    <default expression="" applyOnUpdate="0" field="hrs_rs_est"/>
    <default expression="" applyOnUpdate="0" field="hrs_rs_comp"/>
    <default expression="" applyOnUpdate="0" field="hrs_fw_est"/>
    <default expression="" applyOnUpdate="0" field="hrs_fw_comp"/>
    <default expression="" applyOnUpdate="0" field="hrs_cad_est"/>
    <default expression="" applyOnUpdate="0" field="hrs_cad_comp"/>
    <default expression="" applyOnUpdate="0" field="hrs_misc_est"/>
    <default expression="" applyOnUpdate="0" field="hrs_misc_comp"/>
    <default expression="" applyOnUpdate="0" field="rate_fw"/>
    <default expression="" applyOnUpdate="0" field="rate_cad"/>
    <default expression="" applyOnUpdate="0" field="rate_rs"/>
    <default expression="" applyOnUpdate="0" field="rate_misc"/>
    <default expression="" applyOnUpdate="0" field="amt_fw"/>
    <default expression="" applyOnUpdate="0" field="amt_rs"/>
    <default expression="" applyOnUpdate="0" field="amt_cad"/>
    <default expression="" applyOnUpdate="0" field="amt_misc"/>
    <default expression="" applyOnUpdate="0" field="amt_total"/>
    <default expression="" applyOnUpdate="0" field="amt_dep"/>
    <default expression="" applyOnUpdate="0" field="date_prelim"/>
    <default expression="" applyOnUpdate="0" field="date_finalplans"/>
    <default expression="" applyOnUpdate="0" field="date_mylar"/>
    <default expression="" applyOnUpdate="0" field="date_deeddesc"/>
    <default expression="" applyOnUpdate="0" field="date_pins"/>
    <default expression="" applyOnUpdate="0" field="date_fw"/>
    <default expression="" applyOnUpdate="0" field="date_cad"/>
    <default expression="" applyOnUpdate="0" field="copies_prelim"/>
    <default expression="" applyOnUpdate="0" field="copies_finalplans"/>
    <default expression="" applyOnUpdate="0" field="copies_mylar"/>
    <default expression="" applyOnUpdate="0" field="copies_deeddesc"/>
    <default expression="" applyOnUpdate="0" field="copies_pins"/>
    <default expression="" applyOnUpdate="0" field="copies_fw"/>
    <default expression="" applyOnUpdate="0" field="copies_cad"/>
    <default expression="" applyOnUpdate="0" field="to_prelim"/>
    <default expression="" applyOnUpdate="0" field="to_finalplans"/>
    <default expression="" applyOnUpdate="0" field="to_mylar"/>
    <default expression="" applyOnUpdate="0" field="to_deeddesc"/>
    <default expression="" applyOnUpdate="0" field="to_pins"/>
    <default expression="" applyOnUpdate="0" field="to_fw"/>
    <default expression="" applyOnUpdate="0" field="to_cad"/>
    <default expression="" applyOnUpdate="0" field="date_invoice1"/>
    <default expression="" applyOnUpdate="0" field="date_invoice2"/>
    <default expression="" applyOnUpdate="0" field="date_invoice3"/>
    <default expression="" applyOnUpdate="0" field="amt_invoice1"/>
    <default expression="" applyOnUpdate="0" field="amt_invoice2"/>
    <default expression="" applyOnUpdate="0" field="amt_invoice3"/>
    <default expression="" applyOnUpdate="0" field="lowtide_hrs"/>
    <default expression="" applyOnUpdate="0" field="lowtide"/>
    <default expression="$perimeter" applyOnUpdate="0" field="perimeter"/>
    <default expression="(($area)  / (43560.00))" applyOnUpdate="0" field="area"/>
    <default expression="" applyOnUpdate="0" field="abutters"/>
    <default expression="" applyOnUpdate="0" field="objectid"/>
    <default expression="" applyOnUpdate="0" field="county"/>
    <default expression="" applyOnUpdate="0" field="zipcode"/>
    <default expression="" applyOnUpdate="0" field="lat_lon"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" notnull_strength="1" field="sid" constraints="3" unique_strength="1"/>
    <constraint exp_strength="0" notnull_strength="0" field="id" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="map_bk_lot" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="job_no" constraints="0" unique_strength="0"/>
    <constraint exp_strength="2" notnull_strength="0" field="rev_no" constraints="4" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="old_plan_no" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="job_type" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="job_desc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="folder_name" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="client_name" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="contact_type" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="contact_addr" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="locus_addr" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="town" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="state" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="phone_mobile" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="phone_work" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="phone_home" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="primary_contact" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="email_primary" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="email_secondary" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="recorded_by" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="planbook_page" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="folder_present" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="active" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="pins_set" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_recorded" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_requested" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_fw_sched" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_due" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_estimate_sent" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_dep" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_rs_est" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_rs_comp" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_fw_est" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_fw_comp" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_cad_est" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_cad_comp" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_misc_est" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="hrs_misc_comp" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="rate_fw" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="rate_cad" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="rate_rs" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="rate_misc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_fw" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_rs" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_cad" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_misc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_total" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_dep" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_prelim" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_finalplans" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_mylar" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_deeddesc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_pins" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_fw" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_cad" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_prelim" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_finalplans" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_mylar" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_deeddesc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_pins" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_fw" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="copies_cad" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_prelim" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_finalplans" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_mylar" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_deeddesc" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_pins" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_fw" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="to_cad" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_invoice1" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_invoice2" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="date_invoice3" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_invoice1" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_invoice2" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="amt_invoice3" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="lowtide_hrs" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="lowtide" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="perimeter" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="area" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="abutters" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="objectid" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="county" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="zipcode" constraints="0" unique_strength="0"/>
    <constraint exp_strength="0" notnull_strength="0" field="lat_lon" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="sid"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="map_bk_lot"/>
    <constraint exp="" desc="" field="job_no"/>
    <constraint exp="CASE WHEN   &quot;rev_no&quot;  IS NULL THEN '' ELSE   &quot;rev_no&quot;  &#xd;&#xa;END" desc="" field="rev_no"/>
    <constraint exp="" desc="" field="old_plan_no"/>
    <constraint exp="" desc="" field="job_type"/>
    <constraint exp="" desc="" field="job_desc"/>
    <constraint exp="" desc="" field="folder_name"/>
    <constraint exp="" desc="" field="client_name"/>
    <constraint exp="" desc="" field="contact_type"/>
    <constraint exp="" desc="" field="contact_addr"/>
    <constraint exp="" desc="" field="locus_addr"/>
    <constraint exp="" desc="" field="town"/>
    <constraint exp="" desc="" field="state"/>
    <constraint exp="" desc="" field="phone_mobile"/>
    <constraint exp="" desc="" field="phone_work"/>
    <constraint exp="" desc="" field="phone_home"/>
    <constraint exp="" desc="" field="primary_contact"/>
    <constraint exp="" desc="" field="email_primary"/>
    <constraint exp="" desc="" field="email_secondary"/>
    <constraint exp="" desc="" field="recorded_by"/>
    <constraint exp="" desc="" field="planbook_page"/>
    <constraint exp="" desc="" field="folder_present"/>
    <constraint exp="" desc="" field="active"/>
    <constraint exp="" desc="" field="pins_set"/>
    <constraint exp="" desc="" field="date_recorded"/>
    <constraint exp="" desc="" field="date_requested"/>
    <constraint exp="" desc="" field="date_fw_sched"/>
    <constraint exp="" desc="" field="date_due"/>
    <constraint exp="" desc="" field="date_estimate_sent"/>
    <constraint exp="" desc="" field="date_dep"/>
    <constraint exp="" desc="" field="hrs_rs_est"/>
    <constraint exp="" desc="" field="hrs_rs_comp"/>
    <constraint exp="" desc="" field="hrs_fw_est"/>
    <constraint exp="" desc="" field="hrs_fw_comp"/>
    <constraint exp="" desc="" field="hrs_cad_est"/>
    <constraint exp="" desc="" field="hrs_cad_comp"/>
    <constraint exp="" desc="" field="hrs_misc_est"/>
    <constraint exp="" desc="" field="hrs_misc_comp"/>
    <constraint exp="" desc="" field="rate_fw"/>
    <constraint exp="" desc="" field="rate_cad"/>
    <constraint exp="" desc="" field="rate_rs"/>
    <constraint exp="" desc="" field="rate_misc"/>
    <constraint exp="" desc="" field="amt_fw"/>
    <constraint exp="" desc="" field="amt_rs"/>
    <constraint exp="" desc="" field="amt_cad"/>
    <constraint exp="" desc="" field="amt_misc"/>
    <constraint exp="" desc="" field="amt_total"/>
    <constraint exp="" desc="" field="amt_dep"/>
    <constraint exp="" desc="" field="date_prelim"/>
    <constraint exp="" desc="" field="date_finalplans"/>
    <constraint exp="" desc="" field="date_mylar"/>
    <constraint exp="" desc="" field="date_deeddesc"/>
    <constraint exp="" desc="" field="date_pins"/>
    <constraint exp="" desc="" field="date_fw"/>
    <constraint exp="" desc="" field="date_cad"/>
    <constraint exp="" desc="" field="copies_prelim"/>
    <constraint exp="" desc="" field="copies_finalplans"/>
    <constraint exp="" desc="" field="copies_mylar"/>
    <constraint exp="" desc="" field="copies_deeddesc"/>
    <constraint exp="" desc="" field="copies_pins"/>
    <constraint exp="" desc="" field="copies_fw"/>
    <constraint exp="" desc="" field="copies_cad"/>
    <constraint exp="" desc="" field="to_prelim"/>
    <constraint exp="" desc="" field="to_finalplans"/>
    <constraint exp="" desc="" field="to_mylar"/>
    <constraint exp="" desc="" field="to_deeddesc"/>
    <constraint exp="" desc="" field="to_pins"/>
    <constraint exp="" desc="" field="to_fw"/>
    <constraint exp="" desc="" field="to_cad"/>
    <constraint exp="" desc="" field="date_invoice1"/>
    <constraint exp="" desc="" field="date_invoice2"/>
    <constraint exp="" desc="" field="date_invoice3"/>
    <constraint exp="" desc="" field="amt_invoice1"/>
    <constraint exp="" desc="" field="amt_invoice2"/>
    <constraint exp="" desc="" field="amt_invoice3"/>
    <constraint exp="" desc="" field="lowtide_hrs"/>
    <constraint exp="" desc="" field="lowtide"/>
    <constraint exp="" desc="" field="perimeter"/>
    <constraint exp="" desc="" field="area"/>
    <constraint exp="" desc="" field="abutters"/>
    <constraint exp="" desc="" field="objectid"/>
    <constraint exp="" desc="" field="county"/>
    <constraint exp="" desc="" field="zipcode"/>
    <constraint exp="" desc="" field="lat_lon"/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;objectid&quot;" sortOrder="1">
    <columns>
      <column hidden="0" type="field" width="-1" name="sid"/>
      <column hidden="0" type="field" width="-1" name="map_bk_lot"/>
      <column hidden="0" type="field" width="-1" name="job_no"/>
      <column hidden="0" type="field" width="-1" name="objectid"/>
      <column hidden="0" type="field" width="-1" name="id"/>
      <column hidden="0" type="field" width="-1" name="rev_no"/>
      <column hidden="0" type="field" width="-1" name="old_plan_no"/>
      <column hidden="0" type="field" width="-1" name="job_type"/>
      <column hidden="0" type="field" width="-1" name="job_desc"/>
      <column hidden="0" type="field" width="-1" name="folder_name"/>
      <column hidden="0" type="field" width="-1" name="client_name"/>
      <column hidden="0" type="field" width="-1" name="contact_type"/>
      <column hidden="0" type="field" width="-1" name="contact_addr"/>
      <column hidden="0" type="field" width="-1" name="locus_addr"/>
      <column hidden="0" type="field" width="-1" name="town"/>
      <column hidden="0" type="field" width="-1" name="state"/>
      <column hidden="0" type="field" width="-1" name="phone_mobile"/>
      <column hidden="0" type="field" width="-1" name="phone_work"/>
      <column hidden="0" type="field" width="-1" name="phone_home"/>
      <column hidden="0" type="field" width="-1" name="primary_contact"/>
      <column hidden="0" type="field" width="-1" name="email_primary"/>
      <column hidden="0" type="field" width="-1" name="email_secondary"/>
      <column hidden="0" type="field" width="-1" name="recorded_by"/>
      <column hidden="0" type="field" width="-1" name="planbook_page"/>
      <column hidden="0" type="field" width="-1" name="folder_present"/>
      <column hidden="0" type="field" width="-1" name="active"/>
      <column hidden="0" type="field" width="-1" name="pins_set"/>
      <column hidden="0" type="field" width="-1" name="date_recorded"/>
      <column hidden="0" type="field" width="-1" name="date_requested"/>
      <column hidden="0" type="field" width="-1" name="date_fw_sched"/>
      <column hidden="0" type="field" width="-1" name="date_due"/>
      <column hidden="0" type="field" width="-1" name="date_estimate_sent"/>
      <column hidden="0" type="field" width="-1" name="date_dep"/>
      <column hidden="0" type="field" width="-1" name="hrs_rs_est"/>
      <column hidden="0" type="field" width="-1" name="hrs_rs_comp"/>
      <column hidden="0" type="field" width="-1" name="hrs_fw_est"/>
      <column hidden="0" type="field" width="-1" name="hrs_fw_comp"/>
      <column hidden="0" type="field" width="-1" name="hrs_cad_est"/>
      <column hidden="0" type="field" width="-1" name="hrs_cad_comp"/>
      <column hidden="0" type="field" width="-1" name="hrs_misc_est"/>
      <column hidden="0" type="field" width="-1" name="hrs_misc_comp"/>
      <column hidden="0" type="field" width="-1" name="rate_fw"/>
      <column hidden="0" type="field" width="-1" name="rate_cad"/>
      <column hidden="0" type="field" width="-1" name="rate_rs"/>
      <column hidden="0" type="field" width="-1" name="rate_misc"/>
      <column hidden="0" type="field" width="-1" name="amt_fw"/>
      <column hidden="0" type="field" width="-1" name="amt_rs"/>
      <column hidden="0" type="field" width="-1" name="amt_cad"/>
      <column hidden="0" type="field" width="-1" name="amt_misc"/>
      <column hidden="0" type="field" width="-1" name="amt_total"/>
      <column hidden="0" type="field" width="-1" name="amt_dep"/>
      <column hidden="0" type="field" width="-1" name="date_prelim"/>
      <column hidden="0" type="field" width="-1" name="date_finalplans"/>
      <column hidden="0" type="field" width="-1" name="date_mylar"/>
      <column hidden="0" type="field" width="-1" name="date_deeddesc"/>
      <column hidden="0" type="field" width="-1" name="date_pins"/>
      <column hidden="0" type="field" width="-1" name="date_fw"/>
      <column hidden="0" type="field" width="-1" name="date_cad"/>
      <column hidden="0" type="field" width="-1" name="copies_prelim"/>
      <column hidden="0" type="field" width="-1" name="copies_finalplans"/>
      <column hidden="0" type="field" width="-1" name="copies_mylar"/>
      <column hidden="0" type="field" width="-1" name="copies_deeddesc"/>
      <column hidden="0" type="field" width="-1" name="copies_pins"/>
      <column hidden="0" type="field" width="-1" name="copies_fw"/>
      <column hidden="0" type="field" width="-1" name="copies_cad"/>
      <column hidden="0" type="field" width="-1" name="to_prelim"/>
      <column hidden="0" type="field" width="-1" name="to_finalplans"/>
      <column hidden="0" type="field" width="-1" name="to_mylar"/>
      <column hidden="0" type="field" width="-1" name="to_deeddesc"/>
      <column hidden="0" type="field" width="-1" name="to_pins"/>
      <column hidden="0" type="field" width="-1" name="to_fw"/>
      <column hidden="0" type="field" width="-1" name="to_cad"/>
      <column hidden="0" type="field" width="-1" name="date_invoice1"/>
      <column hidden="0" type="field" width="-1" name="date_invoice2"/>
      <column hidden="0" type="field" width="-1" name="date_invoice3"/>
      <column hidden="0" type="field" width="-1" name="amt_invoice1"/>
      <column hidden="0" type="field" width="-1" name="amt_invoice2"/>
      <column hidden="0" type="field" width="-1" name="amt_invoice3"/>
      <column hidden="0" type="field" width="-1" name="lowtide_hrs"/>
      <column hidden="0" type="field" width="-1" name="lowtide"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" width="-1" name="area"/>
      <column hidden="0" type="field" width="-1" name="perimeter"/>
      <column hidden="0" type="field" width="-1" name="abutters"/>
      <column hidden="0" type="field" width="-1" name="county"/>
      <column hidden="0" type="field" width="-1" name="zipcode"/>
      <column hidden="0" type="field" width="-1" name="lat_lon"/>
    </columns>
  </attributetableconfig>
  <editform>Z:/LeightonProjects/0 - Settings/GIS/QGIS/Plugins/brsgis_plugin/UI/brs_jobs.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:/LeightonProjects/0 - Settings/GIS/QGIS/Plugins/brsgis_plugin/brs_jobs_init.py</editforminitfilepath>
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
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <editable>
    <field editable="1" name="abutters"/>
    <field editable="1" name="active"/>
    <field editable="1" name="amt_cad"/>
    <field editable="1" name="amt_dep"/>
    <field editable="1" name="amt_fw"/>
    <field editable="1" name="amt_invoice1"/>
    <field editable="1" name="amt_invoice2"/>
    <field editable="1" name="amt_invoice3"/>
    <field editable="1" name="amt_misc"/>
    <field editable="1" name="amt_rs"/>
    <field editable="1" name="amt_total"/>
    <field editable="1" name="area"/>
    <field editable="1" name="centroidxy"/>
    <field editable="0" name="client_name"/>
    <field editable="1" name="contact_addr"/>
    <field editable="1" name="contact_type"/>
    <field editable="1" name="copies_cad"/>
    <field editable="1" name="copies_deeddesc"/>
    <field editable="1" name="copies_finalplans"/>
    <field editable="1" name="copies_fw"/>
    <field editable="1" name="copies_mylar"/>
    <field editable="1" name="copies_pins"/>
    <field editable="1" name="copies_prelim"/>
    <field editable="0" name="county"/>
    <field editable="1" name="date_cad"/>
    <field editable="1" name="date_deeddesc"/>
    <field editable="1" name="date_dep"/>
    <field editable="1" name="date_due"/>
    <field editable="1" name="date_estimate_sent"/>
    <field editable="1" name="date_finalplans"/>
    <field editable="1" name="date_fw"/>
    <field editable="1" name="date_fw_sched"/>
    <field editable="1" name="date_invoice1"/>
    <field editable="1" name="date_invoice2"/>
    <field editable="1" name="date_invoice3"/>
    <field editable="1" name="date_mylar"/>
    <field editable="1" name="date_pins"/>
    <field editable="1" name="date_prelim"/>
    <field editable="1" name="date_recorded"/>
    <field editable="1" name="date_requested"/>
    <field editable="1" name="email_primary"/>
    <field editable="1" name="email_secondary"/>
    <field editable="0" name="folder_name"/>
    <field editable="1" name="folder_present"/>
    <field editable="1" name="hrs_cad_comp"/>
    <field editable="1" name="hrs_cad_est"/>
    <field editable="1" name="hrs_fw_comp"/>
    <field editable="1" name="hrs_fw_est"/>
    <field editable="1" name="hrs_misc_comp"/>
    <field editable="1" name="hrs_misc_est"/>
    <field editable="1" name="hrs_rs_comp"/>
    <field editable="1" name="hrs_rs_est"/>
    <field editable="1" name="id"/>
    <field editable="1" name="job_desc"/>
    <field editable="0" name="job_no"/>
    <field editable="1" name="job_type"/>
    <field editable="0" name="lat_lon"/>
    <field editable="1" name="locus_addr"/>
    <field editable="1" name="lowtide"/>
    <field editable="1" name="lowtide_hrs"/>
    <field editable="0" name="map_bk_lot"/>
    <field editable="1" name="objectid"/>
    <field editable="1" name="old_plan_no"/>
    <field editable="1" name="perimeter"/>
    <field editable="1" name="phone_home"/>
    <field editable="1" name="phone_mobile"/>
    <field editable="1" name="phone_work"/>
    <field editable="1" name="pins_set"/>
    <field editable="1" name="planbook_page"/>
    <field editable="1" name="primary_contact"/>
    <field editable="1" name="rate_cad"/>
    <field editable="1" name="rate_fw"/>
    <field editable="1" name="rate_misc"/>
    <field editable="1" name="rate_rs"/>
    <field editable="1" name="recorded_by"/>
    <field editable="1" name="rev_no"/>
    <field editable="1" name="sid"/>
    <field editable="1" name="state"/>
    <field editable="1" name="to_cad"/>
    <field editable="1" name="to_deeddesc"/>
    <field editable="1" name="to_finalplans"/>
    <field editable="1" name="to_fw"/>
    <field editable="1" name="to_mylar"/>
    <field editable="1" name="to_pins"/>
    <field editable="1" name="to_prelim"/>
    <field editable="1" name="town"/>
    <field editable="1" name="zip"/>
    <field editable="0" name="zipcode"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="abutters"/>
    <field labelOnTop="0" name="active"/>
    <field labelOnTop="0" name="amt_cad"/>
    <field labelOnTop="0" name="amt_dep"/>
    <field labelOnTop="0" name="amt_fw"/>
    <field labelOnTop="0" name="amt_invoice1"/>
    <field labelOnTop="0" name="amt_invoice2"/>
    <field labelOnTop="0" name="amt_invoice3"/>
    <field labelOnTop="0" name="amt_misc"/>
    <field labelOnTop="0" name="amt_rs"/>
    <field labelOnTop="0" name="amt_total"/>
    <field labelOnTop="0" name="area"/>
    <field labelOnTop="0" name="centroidxy"/>
    <field labelOnTop="0" name="client_name"/>
    <field labelOnTop="0" name="contact_addr"/>
    <field labelOnTop="0" name="contact_type"/>
    <field labelOnTop="0" name="copies_cad"/>
    <field labelOnTop="0" name="copies_deeddesc"/>
    <field labelOnTop="0" name="copies_finalplans"/>
    <field labelOnTop="0" name="copies_fw"/>
    <field labelOnTop="0" name="copies_mylar"/>
    <field labelOnTop="0" name="copies_pins"/>
    <field labelOnTop="0" name="copies_prelim"/>
    <field labelOnTop="0" name="county"/>
    <field labelOnTop="0" name="date_cad"/>
    <field labelOnTop="0" name="date_deeddesc"/>
    <field labelOnTop="0" name="date_dep"/>
    <field labelOnTop="0" name="date_due"/>
    <field labelOnTop="0" name="date_estimate_sent"/>
    <field labelOnTop="0" name="date_finalplans"/>
    <field labelOnTop="0" name="date_fw"/>
    <field labelOnTop="0" name="date_fw_sched"/>
    <field labelOnTop="0" name="date_invoice1"/>
    <field labelOnTop="0" name="date_invoice2"/>
    <field labelOnTop="0" name="date_invoice3"/>
    <field labelOnTop="0" name="date_mylar"/>
    <field labelOnTop="0" name="date_pins"/>
    <field labelOnTop="0" name="date_prelim"/>
    <field labelOnTop="0" name="date_recorded"/>
    <field labelOnTop="0" name="date_requested"/>
    <field labelOnTop="0" name="email_primary"/>
    <field labelOnTop="0" name="email_secondary"/>
    <field labelOnTop="0" name="folder_name"/>
    <field labelOnTop="0" name="folder_present"/>
    <field labelOnTop="0" name="hrs_cad_comp"/>
    <field labelOnTop="0" name="hrs_cad_est"/>
    <field labelOnTop="0" name="hrs_fw_comp"/>
    <field labelOnTop="0" name="hrs_fw_est"/>
    <field labelOnTop="0" name="hrs_misc_comp"/>
    <field labelOnTop="0" name="hrs_misc_est"/>
    <field labelOnTop="0" name="hrs_rs_comp"/>
    <field labelOnTop="0" name="hrs_rs_est"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="job_desc"/>
    <field labelOnTop="0" name="job_no"/>
    <field labelOnTop="0" name="job_type"/>
    <field labelOnTop="0" name="lat_lon"/>
    <field labelOnTop="0" name="locus_addr"/>
    <field labelOnTop="0" name="lowtide"/>
    <field labelOnTop="0" name="lowtide_hrs"/>
    <field labelOnTop="0" name="map_bk_lot"/>
    <field labelOnTop="0" name="objectid"/>
    <field labelOnTop="0" name="old_plan_no"/>
    <field labelOnTop="0" name="perimeter"/>
    <field labelOnTop="0" name="phone_home"/>
    <field labelOnTop="0" name="phone_mobile"/>
    <field labelOnTop="0" name="phone_work"/>
    <field labelOnTop="0" name="pins_set"/>
    <field labelOnTop="0" name="planbook_page"/>
    <field labelOnTop="0" name="primary_contact"/>
    <field labelOnTop="0" name="rate_cad"/>
    <field labelOnTop="0" name="rate_fw"/>
    <field labelOnTop="0" name="rate_misc"/>
    <field labelOnTop="0" name="rate_rs"/>
    <field labelOnTop="0" name="recorded_by"/>
    <field labelOnTop="0" name="rev_no"/>
    <field labelOnTop="0" name="sid"/>
    <field labelOnTop="0" name="state"/>
    <field labelOnTop="0" name="to_cad"/>
    <field labelOnTop="0" name="to_deeddesc"/>
    <field labelOnTop="0" name="to_finalplans"/>
    <field labelOnTop="0" name="to_fw"/>
    <field labelOnTop="0" name="to_mylar"/>
    <field labelOnTop="0" name="to_pins"/>
    <field labelOnTop="0" name="to_prelim"/>
    <field labelOnTop="0" name="town"/>
    <field labelOnTop="0" name="zip"/>
    <field labelOnTop="0" name="zipcode"/>
  </labelOnTop>
  <widgets>
    <widget name="fk_jobs_contacts">
      <config type="Map">
        <Option type="QString" value="" name="nm-rel"/>
      </config>
    </widget>
  </widgets>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>COALESCE( "folder_name", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
