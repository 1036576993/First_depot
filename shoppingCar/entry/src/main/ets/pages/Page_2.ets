import { http } from '@kit.NetworkKit';
import { internet_icon } from '../Component/internet_icon';
import { shopping, shopping_image, shopping_text } from '../interface/interface';

@Entry
@Component
export struct Page_2 {
  @State message: shopping = { status: 200, code: 200, data: [] } //购物数据

  async sendHttp() {
    const req = http.createHttp() //从网络接口获取购物数据
    const res = await req.request("http://vueshop.glbuys.com/api/home/index/goodsLevel?token=1ec949a15fb709370f")
    let a: string = res.result as string
    let b: string = '/'
    a.replace(b, '')
    this.message = JSON.parse(a) as shopping
  }

  async aboutToAppear() { //初始化数据
    await this.sendHttp()
  }

  build() {
    Column() {
      Swiper() { //展示主体
        Column() {
          ForEach(this.message.data, (icon_message: shopping_image) => { //种类区分
            Row() {
              Text(icon_message.title + ":")
                .fontWeight(FontWeight.Bold)
                .margin({left:3})
            }
            .width("100%")
            .margin({ top: 5 })

            //种类名
            Grid() { //具体展示区
              ForEach(icon_message.items, (text_message: shopping_text) => {
                GridItem() {
                  internet_icon({ message: text_message })
                }
              })
            }
            .height("23%")
            .width("100%")
            .rowsTemplate("2fr")
            .rowsGap(15)
          })
        }
        .margin({top:10})
        .height("100%")
        .width("100%")
      }
      .indicator(false)
      .height("100%")
      .width("100%")
    }
    .height("100%")
    .width("100%")
    .backgroundImage($r("app.media.shopping"))
    .backgroundImageSize(ImageSize.Cover)
  }
}