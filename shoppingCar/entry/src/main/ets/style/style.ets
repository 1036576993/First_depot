import { router } from '@kit.ArkUI'

export class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  isDark: boolean = false
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
    .width("100%")
    .height("100%")
    .gesture(
      PanGesture({direction:PanDirection.Right,distance:20})
        .onActionStart(()=>{
          router.back()
        })
    )
  }
}