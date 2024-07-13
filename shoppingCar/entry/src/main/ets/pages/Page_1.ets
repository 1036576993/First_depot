import { big_icon } from '../Component/big_icon'
import { mini_icon } from '../Component/mini_icon'
import { bigImage_data, image_swiper, miniImage_data } from '../data/data'
import { BigImage, miniImage } from '../interface/interface'

@Entry
@Component
export struct Page_1 {
  build() {
      Column() {
        Swiper(){                                     //顶部轮播图
          ForEach(image_swiper,(e:ResourceStr)=>{
            Row(){
              Image(e)
                .backgroundImageSize(ImageSize.Cover)
                .borderRadius({ topLeft:25,topRight:25 })
            }
          })
        }
        .height(200)
        .width("98%")
        Grid(){                                     //中间层
          ForEach(miniImage_data,(mini:miniImage)=>{
            GridItem(){
              mini_icon({image:mini.image,text:mini.text})
            }
          })
        }
        .margin({top:30,bottom:25})
        .rowsTemplate("1fr 1fr")
        .columnsTemplate("1fr 1fr 1fr 1fr")
        .rowsGap(15)
        .columnsGap(5)
        .width("98%")
        .height(130)
        .backgroundColor(Color.White)
        .borderRadius(30)
        Row(){
          Text("精选:")
            .fontSize(18)
            .margin({left:15})
        }
        .margin({bottom:15})
        .width("100%")
        Scroll(){                                         //底部滑动数据
          Grid(){
            ForEach(bigImage_data,(icon:BigImage)=>{
              GridItem(){
                big_icon({image:icon.image,text:icon.text})
              }
            })
          }
          .columnsTemplate("1fr 1fr")
          .columnsGap(10)
          .rowsGap(10)
          .borderRadius(10)
          .height(Math.ceil(bigImage_data.length/2)*170+20) //160图片 10边距 底部留点空隙
          .width("98%")
        }
        .height(300)
        .width("100%")
      }
      .backgroundColor("#ffe2dfdd")
      .padding(5)
      .width("100%")
      .height("100%")
  }
}