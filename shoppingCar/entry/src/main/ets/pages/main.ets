import { router } from '@kit.ArkUI'
import { Page_1 } from './Page_1';
import { Page_2 } from './Page_2';
import { Page_3 } from './Page_3';

@Entry
@Component
struct body {
  @State index: number = 0                              //当前所在页面索引
  private con: TabsController = new TabsController();   //创建tabs控制器
  @Builder
  page_tab(image:ResourceStr,text:string,index:number){ //tabBar,根据索引确认选中
  Column(){
    Image(image)
      .height(30)
      .width(30)
      .fillColor(this.index==index?"#d778c5f8": "#ffe8b1ff")
      .margin({top:2})
    Text(text)
      .fontColor(this.index==index?"#d778c5f8": "#ffe8b1ff")
  }
  .width("30%")
  .height('100%')

}
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, index: $$this.index, controller: this.con }) {
        TabContent() {
          Page_1()
        }
        .tabBar(this.page_tab($r("app.media.home"),"首页",0))

        TabContent() {
          Page_2()
        }
        .tabBar(this.page_tab($r("app.media.discover"),"发现",1))

        TabContent() {
          Page_3()
        }
        .tabBar(this.page_tab($r("app.media.user_portrait"),"我的",2))

      }
      .width("100%")
      .height("100%")
    }
  }
}