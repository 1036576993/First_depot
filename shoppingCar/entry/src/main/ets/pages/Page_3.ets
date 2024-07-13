import { body1, pubic_1 } from '../Component/page_3_component'
import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
export struct Page_3 {
  @State user_name: string = AppStorage.get<string>("user")!
  @State user_image: ResourceStr = AppStorage.get(this.user_name) == null ? $r("app.media.no_head_image") : AppStorage.get(this.user_name)!

  build() {
    Column() {
      body1({user_image:this.user_image}).margin({top:50})
      pubic_1({message:{re:"app.media.c1",text:"版本更新"}}).margin({top:15,bottom:15}).onClick(()=>{promptAction.showToast({message:"已是最新版本"})})
      pubic_1({message:{re:"app.media.c2",text:"数据检测"}}).onClick(()=>{promptAction.showToast({message:"数据无异常"})})
      pubic_1({message:{re:"app.media.c3",text:"好友互动"}}).onClick(()=>{promptAction.showToast({message:"暂无好友信息"})})
      pubic_1({message:{re:"app.media.c4",text:"订单记录"}}).onClick(()=>{promptAction.showToast({message:"暂无订单记录"})})
      pubic_1({message:{re:"app.media.c5",text:"用户设置"}}).onClick(()=>{promptAction.showToast({message:"无权限"})})
      pubic_1({message:{re:"app.media.c6",text:"安全保护"}}).margin({top:15}).onClick(()=>{promptAction.showToast({message:"安全无异常"})})
      Blank()
      Button("退出")
        .fontColor(Color.Black)
        .fontSize(20)
        .width("95%")
        .height(50)
        .backgroundColor("#ffef6363")
        .margin({left:3,bottom:15})
        .type(ButtonType.Normal)
        .onClick(()=>{
          router.replaceUrl({url:"pages/Index"})
        })
        .borderRadius(15)
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r("app.media.page_3_bc"))
    .backgroundImageSize(ImageSize.Cover)
  }
}

