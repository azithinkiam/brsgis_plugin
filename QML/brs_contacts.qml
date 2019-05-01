<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" hasScaleBasedVisibilityFlag="0" minScale="1e+8" version="3.0.2-Girona" readOnly="0">
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
            <Option name="IsMultiline" type="QString" value="False"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="cid" index="0"/>
    <alias name="" field="contact_type" index="1"/>
    <alias name="" field="jobs_id" index="2"/>
    <alias name="" field="primary_contact" index="3"/>
    <alias name="" field="secondary_contact" index="4"/>
    <alias name="" field="contact_addr" index="5"/>
    <alias name="" field="phone_mobile" index="6"/>
    <alias name="" field="phone_work" index="7"/>
    <alias name="" field="phone_home" index="8"/>
    <alias name="" field="email_primary" index="9"/>
    <alias name="" field="email_secondary" index="10"/>
    <alias name="" field="contact_name" index="11"/>
    <alias name="" field="client" index="12"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="cid" expression=""/>
    <default applyOnUpdate="0" field="contact_type" expression=""/>
    <default applyOnUpdate="0" field="jobs_id" expression=""/>
    <default applyOnUpdate="0" field="primary_contact" expression=""/>
    <default applyOnUpdate="0" field="secondary_contact" expression=""/>
    <default applyOnUpdate="0" field="contact_addr" expression=""/>
    <default applyOnUpdate="0" field="phone_mobile" expression=""/>
    <default applyOnUpdate="0" field="phone_work" expression=""/>
    <default applyOnUpdate="0" field="phone_home" expression=""/>
    <default applyOnUpdate="0" field="email_primary" expression=""/>
    <default applyOnUpdate="0" field="email_secondary" expression=""/>
    <default applyOnUpdate="0" field="contact_name" expression=""/>
    <default applyOnUpdate="0" field="client" expression=""/>
  </defaults>
  <constraints>
    <constraint field="cid" notnull_strength="1" constraints="3" unique_strength="1" exp_strength="0"/>
    <constraint field="contact_type" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="jobs_id" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="primary_contact" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="secondary_contact" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="contact_addr" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="phone_mobile" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="phone_work" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="phone_home" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="email_primary" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="email_secondary" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="contact_name" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="client" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
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
  </constraintExpressions>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="COALESCE( &quot;contact_name&quot;, '&lt;NULL>' )" sortOrder="0">
    <columns>
      <column width="-1" name="cid" hidden="0" type="field"/>
      <column width="-1" name="contact_type" hidden="0" type="field"/>
      <column width="-1" name="jobs_id" hidden="0" type="field"/>
      <column width="-1" name="primary_contact" hidden="0" type="field"/>
      <column width="-1" name="secondary_contact" hidden="0" type="field"/>
      <column width="-1" name="contact_addr" hidden="0" type="field"/>
      <column width="-1" name="phone_mobile" hidden="0" type="field"/>
      <column width="-1" name="phone_work" hidden="0" type="field"/>
      <column width="-1" name="phone_home" hidden="0" type="field"/>
      <column width="-1" name="email_primary" hidden="0" type="field"/>
      <column width="-1" name="email_secondary" hidden="0" type="field"/>
      <column width="-1" name="contact_name" hidden="0" type="field"/>
      <column width="-1" name="client" hidden="0" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <editform>Z:/LeightonProjects/0 - Settings/GIS/QGIS/Plugins/brsgis_plugin/UI/brs_contacts.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:/LeightonProjects/0 - Settings/GIS/QGIS/Plugins/brsgis_plugin/brs_contacts_init.py</editforminitfilepath>
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
