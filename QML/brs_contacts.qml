<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" hasScaleBasedVisibilityFlag="0" maxScale="0" minScale="1e+8" version="3.0.2-Girona">
  <fieldConfiguration>
    <field name="cid">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option name="map" type="List">
              <Option type="Map">
                <Option name="Owner" type="QString" value="Owner"/>
              </Option>
              <Option type="Map">
                <Option name="Buyer" type="QString" value="Buyer"/>
              </Option>
              <Option type="Map">
                <Option name="Seller" type="QString" value="Seller"/>
              </Option>
              <Option type="Map">
                <Option name="Realtor" type="QString" value="Realtor"/>
              </Option>
              <Option type="Map">
                <Option name="Attorney" type="QString" value="Attorney"/>
              </Option>
              <Option type="Map">
                <Option name="Builder" type="QString" value="Builder"/>
              </Option>
              <Option type="Map">
                <Option name="Banker" type="QString" value="Banker"/>
              </Option>
              <Option type="Map">
                <Option name="Leaseholder" type="QString" value="Leaseholder"/>
              </Option>
              <Option type="Map">
                <Option name="Surveyor" type="QString" value="Surveyor"/>
              </Option>
              <Option type="Map">
                <Option name="Architect" type="QString" value="Architect"/>
              </Option>
              <Option type="Map">
                <Option name="Engineer" type="QString" value="Engineer"/>
              </Option>
              <Option type="Map">
                <Option name="Site Contractor" type="QString" value="Site Contractor"/>
              </Option>
              <Option type="Map">
                <Option name="Other" type="QString" value="Other"/>
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
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="primary_contact">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="secondary_contact">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_addr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_mobile">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_work">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="phone_home">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_primary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="email_secondary">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contact_name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="client">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
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
    <default field="cid" applyOnUpdate="0" expression=""/>
    <default field="contact_type" applyOnUpdate="0" expression=""/>
    <default field="jobs_id" applyOnUpdate="0" expression=""/>
    <default field="primary_contact" applyOnUpdate="0" expression=""/>
    <default field="secondary_contact" applyOnUpdate="0" expression=""/>
    <default field="contact_addr" applyOnUpdate="0" expression=""/>
    <default field="phone_mobile" applyOnUpdate="0" expression=""/>
    <default field="phone_work" applyOnUpdate="0" expression=""/>
    <default field="phone_home" applyOnUpdate="0" expression=""/>
    <default field="email_primary" applyOnUpdate="0" expression=""/>
    <default field="email_secondary" applyOnUpdate="0" expression=""/>
    <default field="contact_name" applyOnUpdate="0" expression=""/>
    <default field="client" applyOnUpdate="0" expression=""/>
    <default field="folder" applyOnUpdate="0" expression=""/>
    <default field="flagr" applyOnUpdate="0" expression=""/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" field="cid" exp_strength="0" constraints="3" unique_strength="1"/>
    <constraint notnull_strength="0" field="contact_type" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="jobs_id" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="primary_contact" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="secondary_contact" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="contact_addr" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="phone_mobile" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="phone_work" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="phone_home" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="email_primary" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="email_secondary" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="contact_name" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="client" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="folder" exp_strength="0" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" field="flagr" exp_strength="0" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="cid" exp="" desc=""/>
    <constraint field="contact_type" exp="" desc=""/>
    <constraint field="jobs_id" exp="" desc=""/>
    <constraint field="primary_contact" exp="" desc=""/>
    <constraint field="secondary_contact" exp="" desc=""/>
    <constraint field="contact_addr" exp="" desc=""/>
    <constraint field="phone_mobile" exp="" desc=""/>
    <constraint field="phone_work" exp="" desc=""/>
    <constraint field="phone_home" exp="" desc=""/>
    <constraint field="email_primary" exp="" desc=""/>
    <constraint field="email_secondary" exp="" desc=""/>
    <constraint field="contact_name" exp="" desc=""/>
    <constraint field="client" exp="" desc=""/>
    <constraint field="folder" exp="" desc=""/>
    <constraint field="flagr" exp="" desc=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="COALESCE( &quot;client&quot;, '&lt;NULL>' )" actionWidgetStyle="dropDown" sortOrder="1">
    <columns>
      <column width="-1" name="cid" type="field" hidden="0"/>
      <column width="-1" name="contact_type" type="field" hidden="0"/>
      <column width="-1" name="jobs_id" type="field" hidden="0"/>
      <column width="-1" name="primary_contact" type="field" hidden="0"/>
      <column width="-1" name="secondary_contact" type="field" hidden="0"/>
      <column width="-1" name="contact_addr" type="field" hidden="0"/>
      <column width="-1" name="phone_mobile" type="field" hidden="0"/>
      <column width="-1" name="phone_work" type="field" hidden="0"/>
      <column width="-1" name="phone_home" type="field" hidden="0"/>
      <column width="-1" name="email_primary" type="field" hidden="0"/>
      <column width="-1" name="email_secondary" type="field" hidden="0"/>
      <column width="-1" name="contact_name" type="field" hidden="0"/>
      <column width="-1" name="client" type="field" hidden="0"/>
      <column width="-1" name="folder" type="field" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" name="flagr" type="field" hidden="0"/>
    </columns>
  </attributetableconfig>
  <editform>Z:/0 - Settings/GIS/QGIS/Plugins/profiles/tschmal/python/plugins/brsgis_plugin/UI/brs_contacts.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:\0 - Settings\GIS\QGIS\Plugins\profiles\tschmal\python\plugins\brsgis_plugin\UI\brs_contacts_init.py</editforminitfilepath>
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
    <field name="cid" editable="1"/>
    <field name="client" editable="1"/>
    <field name="contact_addr" editable="1"/>
    <field name="contact_name" editable="1"/>
    <field name="contact_type" editable="1"/>
    <field name="email_primary" editable="1"/>
    <field name="email_secondary" editable="1"/>
    <field name="flagr" editable="1"/>
    <field name="folder" editable="1"/>
    <field name="jobs_id" editable="1"/>
    <field name="phone_home" editable="1"/>
    <field name="phone_mobile" editable="1"/>
    <field name="phone_work" editable="1"/>
    <field name="primary_contact" editable="1"/>
    <field name="secondary_contact" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="cid" labelOnTop="0"/>
    <field name="client" labelOnTop="0"/>
    <field name="contact_addr" labelOnTop="0"/>
    <field name="contact_name" labelOnTop="0"/>
    <field name="contact_type" labelOnTop="0"/>
    <field name="email_primary" labelOnTop="0"/>
    <field name="email_secondary" labelOnTop="0"/>
    <field name="flagr" labelOnTop="0"/>
    <field name="folder" labelOnTop="0"/>
    <field name="jobs_id" labelOnTop="0"/>
    <field name="phone_home" labelOnTop="0"/>
    <field name="phone_mobile" labelOnTop="0"/>
    <field name="phone_work" labelOnTop="0"/>
    <field name="primary_contact" labelOnTop="0"/>
    <field name="secondary_contact" labelOnTop="0"/>
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
