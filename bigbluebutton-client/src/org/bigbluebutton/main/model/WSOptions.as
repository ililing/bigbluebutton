package org.bigbluebutton.main.model
{
	import org.bigbluebutton.core.BBB;

	public class WSOptions
	{
		[Bindable] public var url:String = "";
		[Bindable] public var logoutMethod:String = "";
		[Bindable] public var apiMethod:String = "";
		
		public function parseOptions():void {
			var vxml:XML = BBB.initConfigManager().config.ws;
			if (vxml != null) {
				if (vxml.@url != undefined) {
					url = vxml.@url.toString();
				}
				if (vxml.@logoutMethod != undefined) {
					logoutMethod = vxml.@logoutMethod.toString();
				}
				if (vxml.@apiMethod != undefined) {
					apiMethod = vxml.@apiMethod.toString();
				}

			}
		}
		
	}
}