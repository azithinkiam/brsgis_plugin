<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.0.2-Girona" hasScaleBasedVisibilityFlag="0" maxScale="0" readOnly="0" minScale="1e+8">
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
    <alias name="" field="folder" index="13"/>
    <alias name="" field="flagr" index="14"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="cid" expression="" applyOnUpdate="0"/>
    <default field="contact_type" expression="" applyOnUpdate="0"/>
    <default field="jobs_id" expression="" applyOnUpdate="0"/>
    <default field="primary_contact" expression="" applyOnUpdate="0"/>
    <default field="secondary_contact" expression="" applyOnUpdate="0"/>
    <default field="contact_addr" expression="" applyOnUpdate="0"/>
    <default field="phone_mobile" expression="" applyOnUpdate="0"/>
    <default field="phone_work" expression="" applyOnUpdate="0"/>
    <default field="phone_home" expression="" applyOnUpdate="0"/>
    <default field="email_primary" expression="" applyOnUpdate="0"/>
    <default field="email_secondary" expression="" applyOnUpdate="0"/>
    <default field="contact_name" expression="" applyOnUpdate="0"/>
    <default field="client" expression="" applyOnUpdate="0"/>
    <default field="folder" expression="" applyOnUpdate="0"/>
    <default field="flagr" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" exp_strength="0" field="cid" constraints="3" unique_strength="1"/>
    <constraint notnull_strength="0" exp_strength="0" field="contact_type" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="jobs_id" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="primary_contact" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="secondary_contact" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="contact_addr" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="phone_mobile" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="phone_work" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="phone_home" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="email_primary" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="email_secondary" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="contact_name" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="client" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="folder" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="flagr" constraints="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="cid"/>
    <constraint exp="" desc="" field="contact_type"/>
    <constraint exp="" desc="" field="jobs_id"/>
    <constraint exp="" desc="" field="primary_contact"/>
    <constraint exp="" desc="" field="secondary_contact"/>
    <constraint exp="" desc="" field="contact_addr"/>
    <constraint exp="" desc="" field="phone_mobile"/>
    <constraint exp="" desc="" field="phone_work"/>
    <constraint exp="" desc="" field="phone_home"/>
    <constraint exp="" desc="" field="email_primary"/>
    <constraint exp="" desc="" field="email_secondary"/>
    <constraint exp="" desc="" field="contact_name"/>
    <constraint exp="" desc="" field="client"/>
    <constraint exp="" desc="" field="folder"/>
    <constraint exp="" desc="" field="flagr"/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="1" actionWidgetStyle="dropDown" sortExpression="COALESCE( &quot;client&quot;, '&lt;NULL>' )">
    <columns>
      <column type="field" name="cid" hidden="0" width="-1"/>
      <column type="field" name="contact_type" hidden="0" width="-1"/>
      <column type="field" name="jobs_id" hidden="0" width="-1"/>
      <column type="field" name="primary_contact" hidden="0" width="-1"/>
      <column type="field" name="secondary_contact" hidden="0" width="-1"/>
      <column type="field" name="contact_addr" hidden="0" width="-1"/>
      <column type="field" name="phone_mobile" hidden="0" width="-1"/>
      <column type="field" name="phone_work" hidden="0" width="-1"/>
      <column type="field" name="phone_home" hidden="0" width="-1"/>
      <column type="field" name="email_primary" hidden="0" width="-1"/>
      <column type="field" name="email_secondary" hidden="0" width="-1"/>
      <column type="field" name="contact_name" hidden="0" width="-1"/>
      <column type="field" name="client" hidden="0" width="-1"/>
      <column type="field" name="folder" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
      <column type="field" name="flagr" hidden="0" width="-1"/>
    </columns>
  </attributetableconfig>
  <editform>Z:\0 - Settings\GIS\QGIS\plugins\profiles\tschmal\python\plugins\brsgis_plugin\UI\brs_contacts.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>1</editforminitcodesource>
  <editforminitfilepath>Z:\0 - Settings\GIS\QGIS\plugins\profiles\tschmal\python\plugins\brsgis_plugin\UI\brs_contacts_init.py</editforminitfilepath>
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
