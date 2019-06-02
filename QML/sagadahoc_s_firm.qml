<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.0.2-Girona" simplifyDrawingHints="1" minScale="10000" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="1" simplifyLocal="1" simplifyDrawingTol="1" maxScale="0" simplifyAlgorithm="0" labelsEnabled="1" readOnly="0">
  <renderer-v2 type="singleSymbol" symbollevels="0" forceraster="0" enableorderby="0">
    <symbols>
      <symbol type="fill" name="0" clip_to_extent="1" alpha="1">
        <layer locked="0" pass="0" enabled="1" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="183,183,183,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fontStrikeout="0" fontLetterSpacing="0" isExpression="1" textOpacity="1" multilineHeight="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" textColor="0,0,0,255" fieldName="if( &quot;PNP_REASON&quot;  like '%OPEN WATER%' , &quot;&quot;, concat( 'FIRM#: ',  '\n' ,   &quot;PANEL&quot; ,  &quot;SUFFIX&quot;  ))" fontUnderline="0" blendMode="0" previewBkgrdColor="#ffffff" fontItalic="0" fontWordSpacing="0" namedStyle="Regular" fontCapitals="0" useSubstitutions="0" fontSize="10" fontWeight="50" fontFamily="MS Shell Dlg 2">
        <text-buffer bufferOpacity="0.75" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferColor="130,203,255,255" bufferNoFill="1" bufferDraw="1" bufferSize="1" bufferJoinStyle="128" bufferSizeUnits="MM"/>
        <background shapeRadiiX="0" shapeType="0" shapeRadiiY="0" shapeBorderWidth="0" shapeDraw="0" shapeOffsetY="0" shapeRotation="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeOffsetX="0" shapeRotationType="0" shapeSizeUnit="MM" shapeSVGFile="" shapeSizeY="0" shapeBlendMode="0" shapeSizeX="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeOpacity="1" shapeFillColor="255,255,255,255" shapeRadiiUnit="MM" shapeJoinStyle="64"/>
        <shadow shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowScale="100" shadowOpacity="0.7" shadowOffsetGlobal="1" shadowOffsetAngle="135" shadowUnder="0" shadowColor="0,0,0,255" shadowDraw="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetDist="1" shadowRadius="1.5"/>
        <substitutions/>
      </text-style>
      <text-format addDirectionSymbol="0" plussign="0" placeDirectionSymbol="0" reverseDirectionSymbol="0" formatNumbers="0" decimals="3" multilineAlign="4294967295" leftDirectionSymbol="&lt;" rightDirectionSymbol=">" wrapChar=""/>
      <placement xOffset="0" preserveRotation="1" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="25" centroidWhole="0" centroidInside="1" maxCurvedCharAngleOut="-25" rotationAngle="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" fitInPolygonOnly="1" dist="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="5" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" yOffset="0" repeatDistanceUnits="MM" placementFlags="10" offsetUnits="MM" quadOffset="4" offsetType="0" placement="0" repeatDistance="0" distUnits="MM"/>
      <rendering scaleMin="0" obstacleFactor="1" mergeLines="0" drawLabels="1" scaleMax="0" obstacleType="0" scaleVisibility="0" displayAll="1" fontMinPixelSize="3" upsidedownLabels="0" fontLimitPixelSize="0" zIndex="0" limitNumLabels="0" maxNumLabels="2000" labelPerPart="0" fontMaxPixelSize="10000" minFeatureSize="0" obstacle="1"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option name="properties"/>
          <Option type="QString" name="type" value="collection"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>0.829</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory lineSizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" scaleDependency="Area" sizeType="MM" backgroundColor="#ffffff" minScaleDenominator="0" barWidth="5" minimumSize="0" width="15" penColor="#000000" opacity="1" penWidth="0" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" scaleBasedVisibility="0" maxScaleDenominator="1e+8" labelPlacementMethod="XHeight" penAlpha="255" height="15" enabled="0" rotationOffset="270" backgroundAlpha="255">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" linePlacementFlags="18" obstacle="0" placement="0" zIndex="0" dist="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="DFIRM_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="VERSION_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FIRM_ID">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ST_FIPS">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PCOMM">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PANEL">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="SUFFIX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="FIRM_PAN">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PANEL_TYP">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PRE_DATE">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="EFF_DATE">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="SCALE">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PNP_REASON">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="BASE_TYP">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="SOURCE_CIT">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="DFIRM_ID"/>
    <alias name="" index="1" field="VERSION_ID"/>
    <alias name="" index="2" field="FIRM_ID"/>
    <alias name="" index="3" field="ST_FIPS"/>
    <alias name="" index="4" field="PCOMM"/>
    <alias name="" index="5" field="PANEL"/>
    <alias name="" index="6" field="SUFFIX"/>
    <alias name="" index="7" field="FIRM_PAN"/>
    <alias name="" index="8" field="PANEL_TYP"/>
    <alias name="" index="9" field="PRE_DATE"/>
    <alias name="" index="10" field="EFF_DATE"/>
    <alias name="" index="11" field="SCALE"/>
    <alias name="" index="12" field="PNP_REASON"/>
    <alias name="" index="13" field="BASE_TYP"/>
    <alias name="" index="14" field="SOURCE_CIT"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="DFIRM_ID" applyOnUpdate="0"/>
    <default expression="" field="VERSION_ID" applyOnUpdate="0"/>
    <default expression="" field="FIRM_ID" applyOnUpdate="0"/>
    <default expression="" field="ST_FIPS" applyOnUpdate="0"/>
    <default expression="" field="PCOMM" applyOnUpdate="0"/>
    <default expression="" field="PANEL" applyOnUpdate="0"/>
    <default expression="" field="SUFFIX" applyOnUpdate="0"/>
    <default expression="" field="FIRM_PAN" applyOnUpdate="0"/>
    <default expression="" field="PANEL_TYP" applyOnUpdate="0"/>
    <default expression="" field="PRE_DATE" applyOnUpdate="0"/>
    <default expression="" field="EFF_DATE" applyOnUpdate="0"/>
    <default expression="" field="SCALE" applyOnUpdate="0"/>
    <default expression="" field="PNP_REASON" applyOnUpdate="0"/>
    <default expression="" field="BASE_TYP" applyOnUpdate="0"/>
    <default expression="" field="SOURCE_CIT" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" field="DFIRM_ID" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="VERSION_ID" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="FIRM_ID" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="ST_FIPS" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="PCOMM" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="PANEL" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="SUFFIX" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="FIRM_PAN" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="PANEL_TYP" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="PRE_DATE" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="EFF_DATE" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="SCALE" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="PNP_REASON" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="BASE_TYP" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="SOURCE_CIT" exp_strength="0" constraints="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="DFIRM_ID" exp=""/>
    <constraint desc="" field="VERSION_ID" exp=""/>
    <constraint desc="" field="FIRM_ID" exp=""/>
    <constraint desc="" field="ST_FIPS" exp=""/>
    <constraint desc="" field="PCOMM" exp=""/>
    <constraint desc="" field="PANEL" exp=""/>
    <constraint desc="" field="SUFFIX" exp=""/>
    <constraint desc="" field="FIRM_PAN" exp=""/>
    <constraint desc="" field="PANEL_TYP" exp=""/>
    <constraint desc="" field="PRE_DATE" exp=""/>
    <constraint desc="" field="EFF_DATE" exp=""/>
    <constraint desc="" field="SCALE" exp=""/>
    <constraint desc="" field="PNP_REASON" exp=""/>
    <constraint desc="" field="BASE_TYP" exp=""/>
    <constraint desc="" field="SOURCE_CIT" exp=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column type="field" name="DFIRM_ID" hidden="0" width="-1"/>
      <column type="field" name="VERSION_ID" hidden="0" width="-1"/>
      <column type="field" name="FIRM_ID" hidden="0" width="-1"/>
      <column type="field" name="ST_FIPS" hidden="0" width="-1"/>
      <column type="field" name="PCOMM" hidden="0" width="-1"/>
      <column type="field" name="PANEL" hidden="0" width="-1"/>
      <column type="field" name="SUFFIX" hidden="0" width="-1"/>
      <column type="field" name="FIRM_PAN" hidden="0" width="-1"/>
      <column type="field" name="PANEL_TYP" hidden="0" width="-1"/>
      <column type="field" name="PRE_DATE" hidden="0" width="-1"/>
      <column type="field" name="EFF_DATE" hidden="0" width="-1"/>
      <column type="field" name="SCALE" hidden="0" width="-1"/>
      <column type="field" name="PNP_REASON" hidden="0" width="-1"/>
      <column type="field" name="BASE_TYP" hidden="0" width="-1"/>
      <column type="field" name="SOURCE_CIT" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <editform>Z:/0 - Settings/GIS/QGIS</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
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
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="BASE_TYP" editable="1"/>
    <field name="DFIRM_ID" editable="1"/>
    <field name="EFF_DATE" editable="1"/>
    <field name="FIRM_ID" editable="1"/>
    <field name="FIRM_PAN" editable="1"/>
    <field name="OBJECTID" editable="1"/>
    <field name="PANEL" editable="1"/>
    <field name="PANEL_TYP" editable="1"/>
    <field name="PCOMM" editable="1"/>
    <field name="PNP_REASON" editable="1"/>
    <field name="PRE_DATE" editable="1"/>
    <field name="SCALE" editable="1"/>
    <field name="SHAPE_Area" editable="1"/>
    <field name="SHAPE_Length" editable="1"/>
    <field name="SOURCE_CIT" editable="1"/>
    <field name="ST_FIPS" editable="1"/>
    <field name="SUFFIX" editable="1"/>
    <field name="VERSION_ID" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="BASE_TYP" labelOnTop="0"/>
    <field name="DFIRM_ID" labelOnTop="0"/>
    <field name="EFF_DATE" labelOnTop="0"/>
    <field name="FIRM_ID" labelOnTop="0"/>
    <field name="FIRM_PAN" labelOnTop="0"/>
    <field name="OBJECTID" labelOnTop="0"/>
    <field name="PANEL" labelOnTop="0"/>
    <field name="PANEL_TYP" labelOnTop="0"/>
    <field name="PCOMM" labelOnTop="0"/>
    <field name="PNP_REASON" labelOnTop="0"/>
    <field name="PRE_DATE" labelOnTop="0"/>
    <field name="SCALE" labelOnTop="0"/>
    <field name="SHAPE_Area" labelOnTop="0"/>
    <field name="SHAPE_Length" labelOnTop="0"/>
    <field name="SOURCE_CIT" labelOnTop="0"/>
    <field name="ST_FIPS" labelOnTop="0"/>
    <field name="SUFFIX" labelOnTop="0"/>
    <field name="VERSION_ID" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>OBJECTID</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
