package
{
   import mx.core.IFlexModuleFactory;
   import mx.styles.CSSStyleDeclaration;
   import mx.styles.StyleManager;
   import mx.skins.halo.RadioButtonIcon;
   
   public class _RadioButtonStyle
   {
       
      public function _RadioButtonStyle()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var fbs:IFlexModuleFactory = param1;
         var style:CSSStyleDeclaration = StyleManager.getStyleDeclaration("RadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration();
            StyleManager.setStyleDeclaration("RadioButton",style,false);
         }
         if(style.defaultFactory == null)
         {
            style.defaultFactory = function():void
            {
               _RadioButtonStyle.downSkin = null;
               _RadioButtonStyle.iconColor = 2831164;
               _RadioButtonStyle.cornerRadius = 7;
               _RadioButtonStyle.selectedDownIcon = null;
               _RadioButtonStyle.selectedUpSkin = null;
               _RadioButtonStyle.overIcon = null;
               _RadioButtonStyle.skin = null;
               _RadioButtonStyle.upSkin = null;
               _RadioButtonStyle.selectedDownSkin = null;
               _RadioButtonStyle.selectedOverIcon = null;
               _RadioButtonStyle.selectedDisabledIcon = null;
               _RadioButtonStyle.textAlign = "left";
               _RadioButtonStyle.horizontalGap = 5;
               _RadioButtonStyle.downIcon = null;
               _RadioButtonStyle.icon = RadioButtonIcon;
               _RadioButtonStyle.overSkin = null;
               _RadioButtonStyle.disabledIcon = null;
               _RadioButtonStyle.selectedDisabledSkin = null;
               _RadioButtonStyle.upIcon = null;
               _RadioButtonStyle.paddingLeft = 0;
               _RadioButtonStyle.paddingRight = 0;
               _RadioButtonStyle.fontWeight = "normal";
               _RadioButtonStyle.selectedUpIcon = null;
               _RadioButtonStyle.disabledSkin = null;
               _RadioButtonStyle.selectedOverSkin = null;
            };
         }
      }
   }
}