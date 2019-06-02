<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.0.2-Girona" simplifyDrawingHints="1" minScale="5000" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="1" simplifyLocal="1" simplifyDrawingTol="1" maxScale="0" simplifyAlgorithm="0" labelsEnabled="0" readOnly="0">
  <renderer-v2 type="singleSymbol" symbollevels="0" forceraster="0" enableorderby="0">
    <symbols>
      <symbol type="fill" name="0" clip_to_extent="1" alpha="0.298039">
        <layer locked="0" pass="0" enabled="1" class="SimpleFill">
          <prop k="border_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="color" v="82,207,218,255"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.26"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="style" v="solid"/>
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
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>1</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory lineSizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" scaleDependency="Area" sizeType="MM" backgroundColor="#ffffff" minScaleDenominator="0" barWidth="5" minimumSize="0" width="15" penColor="#000000" opacity="1" penWidth="0" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" scaleBasedVisibility="0" maxScaleDenominator="1e+8" labelPlacementMethod="XHeight" penAlpha="255" height="15" enabled="0" rotationOffset="270" backgroundAlpha="255">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" color="#000000" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" linePlacementFlags="2" obstacle="0" placement="0" zIndex="0" dist="0" showAll="1">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="OBJECTID">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="SECONDARY_">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="HAT_FT_NAV">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="OBJECTID"/>
    <alias name="" index="1" field="SECONDARY_"/>
    <alias name="" index="2" field="HAT_FT_NAV"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="OBJECTID" applyOnUpdate="0"/>
    <default expression="" field="SECONDARY_" applyOnUpdate="0"/>
    <default expression="" field="HAT_FT_NAV" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" field="OBJECTID" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="SECONDARY_" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="HAT_FT_NAV" exp_strength="0" constraints="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="OBJECTID" exp=""/>
    <constraint desc="" field="SECONDARY_" exp=""/>
    <constraint desc="" field="HAT_FT_NAV" exp=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column type="field" name="OBJECTID" hidden="0" width="-1"/>
      <column type="field" name="SECONDARY_" hidden="0" width="-1"/>
      <column type="field" name="HAT_FT_NAV" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <editform>C:/Users/User/Documents</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>C:/Users/User/Documents</editforminitfilepath>
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
    <field name="HAT_FT_NAV" editable="1"/>
    <field name="OBJECTID" editable="1"/>
    <field name="SECONDARY_" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="HAT_FT_NAV" labelOnTop="0"/>
    <field name="OBJECTID" labelOnTop="0"/>
    <field name="SECONDARY_" labelOnTop="0"/>
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
