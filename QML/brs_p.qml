<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" simplifyDrawingTol="1" labelsEnabled="0" minScale="1e+8" simplifyAlgorithm="0" version="3.0.2-Girona" simplifyDrawingHints="1" hasScaleBasedVisibilityFlag="0" simplifyLocal="1" readOnly="0" simplifyMaxScale="1">
  <renderer-v2 enableorderby="0" type="singleSymbol" symbollevels="0" forceraster="0">
    <symbols>
      <symbol name="0" alpha="0.5" type="fill" clip_to_extent="1">
        <layer enabled="1" class="SimpleFill" locked="0" pass="0">
          <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
          <prop v="90,239,215,255" k="color"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.26" k="outline_width"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="solid" k="style"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory labelPlacementMethod="XHeight" diagramOrientation="Up" minimumSize="0" scaleDependency="Area" opacity="1" rotationOffset="270" backgroundAlpha="255" penAlpha="255" backgroundColor="#ffffff" penWidth="0" scaleBasedVisibility="0" minScaleDenominator="0" maxScaleDenominator="1e+8" height="15" penColor="#000000" enabled="0" width="15" sizeType="MM" sizeScale="3x:0,0,0,0,0,0" lineSizeType="MM" barWidth="5" lineSizeScale="3x:0,0,0,0,0,0">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" placement="0" obstacle="0" zIndex="0" priority="0" dist="0" linePlacementFlags="18">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="gid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="objectid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lat_lon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="zipcode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="map_bk_lot">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="p_no">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="address">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="town">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="initials">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="creator">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rev_no">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="notes">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="gid"/>
    <alias index="1" name="" field="objectid"/>
    <alias index="2" name="" field="lat_lon"/>
    <alias index="3" name="" field="zipcode"/>
    <alias index="4" name="" field="map_bk_lot"/>
    <alias index="5" name="" field="id"/>
    <alias index="6" name="" field="p_no"/>
    <alias index="7" name="" field="name"/>
    <alias index="8" name="" field="address"/>
    <alias index="9" name="" field="town"/>
    <alias index="10" name="" field="date"/>
    <alias index="11" name="" field="initials"/>
    <alias index="12" name="" field="creator"/>
    <alias index="13" name="" field="rev_no"/>
    <alias index="14" name="" field="notes"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="gid"/>
    <default expression="" applyOnUpdate="0" field="objectid"/>
    <default expression="" applyOnUpdate="0" field="lat_lon"/>
    <default expression="" applyOnUpdate="0" field="zipcode"/>
    <default expression="" applyOnUpdate="0" field="map_bk_lot"/>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="" applyOnUpdate="0" field="p_no"/>
    <default expression="" applyOnUpdate="0" field="name"/>
    <default expression="" applyOnUpdate="0" field="address"/>
    <default expression="" applyOnUpdate="0" field="town"/>
    <default expression="" applyOnUpdate="0" field="date"/>
    <default expression="" applyOnUpdate="0" field="initials"/>
    <default expression="" applyOnUpdate="0" field="creator"/>
    <default expression="" applyOnUpdate="0" field="rev_no"/>
    <default expression="" applyOnUpdate="0" field="notes"/>
  </defaults>
  <constraints>
    <constraint constraints="3" unique_strength="1" notnull_strength="1" field="gid" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="objectid" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="lat_lon" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="zipcode" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="map_bk_lot" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="id" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="p_no" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="name" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="address" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="town" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="date" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="initials" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="creator" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="rev_no" exp_strength="0"/>
    <constraint constraints="0" unique_strength="0" notnull_strength="0" field="notes" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="gid" desc=""/>
    <constraint exp="" field="objectid" desc=""/>
    <constraint exp="" field="lat_lon" desc=""/>
    <constraint exp="" field="zipcode" desc=""/>
    <constraint exp="" field="map_bk_lot" desc=""/>
    <constraint exp="" field="id" desc=""/>
    <constraint exp="" field="p_no" desc=""/>
    <constraint exp="" field="name" desc=""/>
    <constraint exp="" field="address" desc=""/>
    <constraint exp="" field="town" desc=""/>
    <constraint exp="" field="date" desc=""/>
    <constraint exp="" field="initials" desc=""/>
    <constraint exp="" field="creator" desc=""/>
    <constraint exp="" field="rev_no" desc=""/>
    <constraint exp="" field="notes" desc=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;map_bk_lot&quot;" sortOrder="1" actionWidgetStyle="dropDown">
    <columns>
      <column name="gid" hidden="0" width="-1" type="field"/>
      <column name="objectid" hidden="0" width="-1" type="field"/>
      <column name="lat_lon" hidden="0" width="-1" type="field"/>
      <column name="zipcode" hidden="0" width="-1" type="field"/>
      <column name="map_bk_lot" hidden="0" width="-1" type="field"/>
      <column name="name" hidden="0" width="-1" type="field"/>
      <column name="address" hidden="0" width="-1" type="field"/>
      <column name="town" hidden="0" width="-1" type="field"/>
      <column name="date" hidden="0" width="-1" type="field"/>
      <column name="initials" hidden="0" width="-1" type="field"/>
      <column name="notes" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
      <column name="creator" hidden="0" width="-1" type="field"/>
      <column name="rev_no" hidden="0" width="-1" type="field"/>
      <column name="p_no" hidden="0" width="-1" type="field"/>
      <column name="id" hidden="0" width="-1" type="field"/>
    </columns>
  </attributetableconfig>
  <editform>z:/LeightonProjects/0 - settings/gis/qgis/plugins/brsgis_plugin/ui/brs_p.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>z:/LeightonProjects/0 - settings/gis/qgis/plugins/brsgis_plugin/brs_p_init.py</editforminitfilepath>
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
    <field name="address" editable="1"/>
    <field name="cd_no" editable="1"/>
    <field name="county" editable="1"/>
    <field name="creator" editable="1"/>
    <field name="date" editable="1"/>
    <field name="file_no" editable="1"/>
    <field name="gid" editable="1"/>
    <field name="id" editable="1"/>
    <field name="initials" editable="1"/>
    <field name="job" editable="1"/>
    <field name="lat_lon" editable="1"/>
    <field name="lot" editable="1"/>
    <field name="map" editable="1"/>
    <field name="map_bk_lot" editable="1"/>
    <field name="name" editable="1"/>
    <field name="notes" editable="1"/>
    <field name="objectid" editable="1"/>
    <field name="p_no" editable="1"/>
    <field name="rev_no" editable="1"/>
    <field name="size_no" editable="1"/>
    <field name="surveyor" editable="1"/>
    <field name="town" editable="1"/>
    <field name="town_parce" editable="1"/>
    <field name="zipcode" editable="1"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="address"/>
    <field labelOnTop="0" name="cd_no"/>
    <field labelOnTop="0" name="county"/>
    <field labelOnTop="0" name="creator"/>
    <field labelOnTop="0" name="date"/>
    <field labelOnTop="0" name="file_no"/>
    <field labelOnTop="0" name="gid"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="initials"/>
    <field labelOnTop="0" name="job"/>
    <field labelOnTop="0" name="lat_lon"/>
    <field labelOnTop="0" name="lot"/>
    <field labelOnTop="0" name="map"/>
    <field labelOnTop="0" name="map_bk_lot"/>
    <field labelOnTop="0" name="name"/>
    <field labelOnTop="0" name="notes"/>
    <field labelOnTop="0" name="objectid"/>
    <field labelOnTop="0" name="p_no"/>
    <field labelOnTop="0" name="rev_no"/>
    <field labelOnTop="0" name="size_no"/>
    <field labelOnTop="0" name="surveyor"/>
    <field labelOnTop="0" name="town"/>
    <field labelOnTop="0" name="town_parce"/>
    <field labelOnTop="0" name="zipcode"/>
  </labelOnTop>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>gid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
