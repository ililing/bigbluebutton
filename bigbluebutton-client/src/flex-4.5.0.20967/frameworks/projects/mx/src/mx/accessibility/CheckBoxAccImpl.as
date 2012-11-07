////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2003-2006 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.accessibility
{

import mx.accessibility.AccConst;
import mx.controls.Button;
import mx.controls.CheckBox;
import mx.core.UIComponent;
import mx.core.mx_internal;

use namespace mx_internal;

/**
 *  CheckBoxAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the CheckBox class.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 9
 *  @playerversion AIR 1.1
 *  @productversion Flex 3
 */
public class CheckBoxAccImpl extends ButtonAccImpl
{
    include "../core/Version.as";

	//--------------------------------------------------------------------------
	//
	//  Class methods
	//
	//--------------------------------------------------------------------------

	/**
	 *  Enables accessibility in the CheckBox class.
	 * 
	 *  <p>This method is called by application startup code
	 *  that is autogenerated by the MXML compiler.
	 *  Afterwards, when instances of CheckBox are initialized,
	 *  their <code>accessibilityImplementation</code> property
	 *  will be set to an instance of this class.</p>
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	public static function enableAccessibility():void
	{
		CheckBox.createAccessibilityImplementation =
			createAccessibilityImplementation;
	}

	/**
	 *  @private
	 *  Creates a CheckBox's AccessibilityImplementation object.
	 *  This method is called from UIComponent's
	 *  initializeAccessibility() method.
	 */
	mx_internal static function createAccessibilityImplementation(
								component:UIComponent):void
	{
		component.accessibilityImplementation =
			new CheckBoxAccImpl(component);
	}

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------

	/**
	 *  Constructor.
	 *
	 *  @param master The UIComponent instance that this AccImpl instance
	 *  is making accessible.
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */
	public function CheckBoxAccImpl(master:UIComponent)
	{
		super(master);

		role = AccConst.ROLE_SYSTEM_CHECKBUTTON;
	}

	//--------------------------------------------------------------------------
	//
	//  Overridden methods: AccessibilityImplementation
	//
	//--------------------------------------------------------------------------

	/**
	 *  @private
	 *  IAccessible method for returning the state of the CheckBox.
	 *  States are predefined for all the components in MSAA.
	 *  Values are assigned to each state.
	 *  Depending upon whether the CheckBox is checked or unchecked,
	 *  a value is returned.
	 *
	 *  @param childID uint
	 *
	 *  @return State Whether the CheckBox is checked or unchecked.
	 */
	override public function get_accState(childID:uint):uint
	{
		var accState:uint = getState(childID);
		
		if (Button(master).selected)
			accState |= AccConst.STATE_SYSTEM_CHECKED;

		return accState;
	}

	/**
	 *  @private
	 *  IAccessible method for returning the default action of
	 *  the CheckBox, which is Check or UnCheck depending on the state.
	 *
	 *  @param childID uint
	 *
	 *  @return DefaultAction Check or UnCheck.
	 */
	override public function get_accDefaultAction(childID:uint):String
	{
		return Button(master).selected ? "UnCheck" : "Check";
	}
}

}
