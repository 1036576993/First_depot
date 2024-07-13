import { router } from '@kit.ArkUI';

@Entry
@Component
struct Error {
  @State message: string = '该页面暂无人员维护';

  build() {
      Column() {
        Row(){
          Image($r("app.media.reply"))
            .height(35)
            .margin(15)
        }
        .width("100%")
          .onClick(()=>{
            router.back()
          })
        Text(this.message)
          .fontSize(45)
          .fontWeight(FontWeight.Bold)
          .offset({y:240})
      }
      .width('100%')
      .height('100%')
  }
}