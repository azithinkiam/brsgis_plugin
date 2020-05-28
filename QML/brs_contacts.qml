<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+8" version="3.2.3-Bonn" maxScale="0" readOnly="0" hasScaleBasedVisibilityFlag="0">
  <fieldConfiguration>
    <field name="cid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" value="Owner" name="Owner"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Buyer" name="Buyer"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Seller" name="Seller"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Realtor" name="Realtor"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Attorney" name="Attorney"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Builder" name="Builder"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Banker" name="Banker"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Leaseholder" name="Leaseholder"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Surveyor" name="Surveyor"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Site Contractor" name="Site Contractor"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Architect" name="Architect"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Engineer" name="Engineer"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Other" name="Other"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="Utility" name="Utility"/>
              </Option>
              <Option type="Map">
                <Option type="QString" value="D.O.T." name="D.O.T."/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="jobs_id">
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
    <field name="secondary_contact">
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
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
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
    <field name="contact_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" value="False" name="IsMultiline"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="client">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="folder">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="flagr">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="cid" index="0" name=""/>
    <alias field="contact_type" index="1" name=""/>
    <alias field="jobs_id" index="2" name=""/>
    <alias field="primary_contact" index="3" name=""/>
    <alias field="secondary_contact" index="4" name=""/>
    <alias field="contact_addr" index="5" name=""/>
    <alias field="phone_mobile" index="6" name=""/>
    <alias field="phone_work" index="7" name=""/>
    <alias field="phone_home" index="8" name=""/>
    <alias field="email_primary" index="9" name=""/>
    <alias field="email_secondary" index="10" name=""/>
    <alias field="contact_name" index="11" name=""/>
    <alias field="client" index="12" name=""/>
    <alias field="folder" index="13" name=""/>
    <alias field="flagr" index="14" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="cid" applyOnUpdate="0"/>
    <default expression="" field="contact_type" applyOnUpdate="0"/>
    <default expression="" field="jobs_id" applyOnUpdate="0"/>
    <default expression="" field="primary_contact" applyOnUpdate="0"/>
    <default expression="" field="secondary_contact" applyOnUpdate="0"/>
    <default expression="" field="contact_addr" applyOnUpdate="0"/>
    <default expression="" field="phone_mobile" applyOnUpdate="0"/>
    <default expression="" field="phone_work" applyOnUpdate="0"/>
    <default expression="" field="phone_home" applyOnUpdate="0"/>
    <default expression="" field="email_primary" applyOnUpdate="0"/>
    <default expression="" field="email_secondary" applyOnUpdate="0"/>
    <default expression="" field="contact_name" applyOnUpdate="0"/>
    <default expression="" field="client" applyOnUpdate="0"/>
    <default expression="" field="folder" applyOnUpdate="0"/>
    <default expression="" field="flagr" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="cid" exp_strength="0" constraints="3" notnull_strength="1"/>
    <constraint unique_strength="0" field="contact_type" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="jobs_id" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="primary_contact" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="secondary_contact" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="contact_addr" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="phone_mobile" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="phone_work" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="phone_home" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="email_primary" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="email_secondary" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="contact_name" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="client" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="folder" exp_strength="0" constraints="0" notnull_strength="0"/>
    <constraint unique_strength="0" field="flagr" exp_strength="0" constraints="0" notnull_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="cid" desc=""/>
    <constraint exp="" field="contact_type" desc=""/>
    <constraint exp="" field="jobs_id" desc=""/>
    <constraint exp="" field="primary_contact" desc=""/>
    <constraint exp="" field="secondary_contact" desc=""/>
    <constraint exp="" field="contact_addr" desc=""/>
    <constraint exp="" field="phone_mobile" desc=""/>
    <constraint exp="" field="phone_work" desc=""/>
    <constraint exp="" field="phone_home" desc=""/>
    <constraint exp="" field="email_primary" desc=""/>
    <constraint exp="" field="email_secondary" desc=""/>
    <constraint exp="" field="contact_name" desc=""/>
    <constraint exp="" field="client" desc=""/>
    <constraint exp="" field="folder" desc=""/>
    <constraint exp="" field="flagr" desc=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="1" sortExpression="COALESCE( &quot;client&quot;, '&lt;NULL>' )" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" hidden="0" width="-1" name="cid"/>
      <column type="field" hidden="0" width="-1" name="contact_type"/>
      <column type="field" hidden="0" width="-1" name="jobs_id"/>
      <column type="field" hidden="0" width="-1" name="primary_contact"/>
      <column type="field" hidden="0" width="-1" name="secondary_contact"/>
      <column type="field" hidden="0" width="-1" name="contact_addr"/>
      <column type="field" hidden="0" width="-1" name="phone_mobile"/>
      <column type="field" hidden="0" width="-1" name="phone_work"/>
      <column type="field" hidden="0" width="-1" name="phone_home"/>
      <column type="field" hidden="0" width="-1" name="email_primary"/>
      <column type="field" hidden="0" width="-1" name="email_secondary"/>
      <column type="field" hidden="0" width="-1" name="contact_name"/>
      <column type="field" hidden="0" width="-1" name="client"/>
      <column type="field" hidden="0" width="-1" name="folder"/>
      <column type="actions" hidden="1" width="-1"/>
      <column type="field" hidden="0" width="-1" name="flagr"/>
    </columns>
  </attributetableconfig>
  <editform tolerant="1">Z:\0 - Settings\GIS\QGIS\Plugins\profiles\default\python\plugins\brsgis_plugin\UI\brs_contacts.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:\0 - Settings\GIS\QGIS\Plugins\profiles\default\python\plugins\brsgis_plugin\UI\brs_contacts_init.py</editforminitfilepath>
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
    <field editable="1" name="cid"/>
    <field editable="1" name="client"/>
    <field editable="1" name="contact_addr"/>
    <field editable="1" name="contact_name"/>
    <field editable="1" name="contact_type"/>
    <field editable="1" name="email_primary"/>
    <field editable="1" name="email_secondary"/>
    <field editable="1" name="flagr"/>
    <field editable="1" name="folder"/>
    <field editable="1" name="jobs_id"/>
    <field editable="1" name="phone_home"/>
    <field editable="1" name="phone_mobile"/>
    <field editable="1" name="phone_work"/>
    <field editable="1" name="primary_contact"/>
    <field editable="1" name="secondary_contact"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="cid"/>
    <field labelOnTop="0" name="client"/>
    <field labelOnTop="0" name="contact_addr"/>
    <field labelOnTop="0" name="contact_name"/>
    <field labelOnTop="0" name="contact_type"/>
    <field labelOnTop="0" name="email_primary"/>
    <field labelOnTop="0" name="email_secondary"/>
    <field labelOnTop="0" name="flagr"/>
    <field labelOnTop="0" name="folder"/>
    <field labelOnTop="0" name="jobs_id"/>
    <field labelOnTop="0" name="phone_home"/>
    <field labelOnTop="0" name="phone_mobile"/>
    <field labelOnTop="0" name="phone_work"/>
    <field labelOnTop="0" name="primary_contact"/>
    <field labelOnTop="0" name="secondary_contact"/>
  </labelOnTop>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>COALESCE( "contact_name", '&lt;NULL>' )</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
