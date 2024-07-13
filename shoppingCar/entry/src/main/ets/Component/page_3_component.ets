import { image_head } from '../data/data';
import { message_info, user_info } from '../interface/interface';
import { router } from '@kit.ArkUI';

@Component
export struct body1{
  @State check:boolean=false                                    //是否修改数据
  @State user_image:ResourceStr=''                              //用户图片
  @State state:string=''                                        //用户状态
  index:number=0                                                //用户所在存储位置
  userinfo:user_info[]=[]            //用户所有数据
  state_dialog:string[]=["空闲","繁忙","暂离","游戏中","学习中"]    //用户状态选择列表
  image_select:CustomDialogController = new CustomDialogController({
    builder:body1_image({image:this.user_image})
  })
  aboutToAppear(): void {                                       //校验获取当前用户数据
    this.userinfo= AppStorage.get("userInfo")!
    this.userinfo.forEach((element:user_info,index:number) => {
      if(AppStorage.get("user")==element.user){
        if(element.avatar!=''){
          this.user_image=element.avatar
        }
        if (element.state!=null) {
          this.state=element.state
        }
        this.index=index
        return
      }
    });
  }
  build() {
    Column(){
        Button("确认修改数据")                                    //更新数据
          .onClick(()=>{
            this.userinfo[this.index].state=this.state
            this.userinfo[this.index].avatar=this.user_image
            AppStorage.setOrCreate("user_info",this.userinfo)
            this.check=false
          })
          .backgroundColor("#666")
          .fontColor(Color.Black)
          .height(30)
          .margin({right:20})
          .visibility(this.check?Visibility.Visible:Visibility.Hidden)
      Row(){
        Image(this.user_image)
          .height(80)
          .aspectRatio(1)
          .borderRadius(20)
          .margin({left:23})
          .onClick(()=>{                //图片点击可更改
            this.image_select.open()
            this.check=true
          })
        Column(){
          Text(AppStorage.get("user"))
            .fontWeight(FontWeight.Bolder)
            .margin({left:15})
            .alignSelf(ItemAlign.Start)
            .fontSize(20)
          Row(){
            Text("微信号: WXid_9BlkKr")
              .fontColor(Color.Gray)
              .margin({left:15,right:20,top:5})
            Image($r("app.media.ic_public_input_code"))
              .margin({top:5})
              .fillColor(Color.Gray)
              .height(20)
            Image($r("app.media.ic_public_arrow_right"))
              .fillColor(Color.Gray)
              .margin({left:5,top:3})
              .height(25)
          }
          .alignItems(VerticalAlign.Top)
          .height("35")
          .width("100%")
          Row(){
            Button(this.state==''?"+ 状态":this.state)
              .width(70)
              .height(25)
              .margin({left:15,right:5})
              .fontColor(Color.Gray)
              .backgroundColor(Color.White)
              .borderColor(Color.Gray)
              .borderWidth(1)
              .onClick(()=>{                //状态点击可更改
                this.check=true
                TextPickerDialog.show({
                  range:this.state_dialog,
                  onAccept:(value)=>{
                    this.state=value.value as string
                  }
                })
              })
            Button(){
              Row(){
                Image($r("app.media.ljj"))
                  .height(15)
                  .borderRadius(25)
                Image($r("app.media.yyh"))
                  .height(15)
                  .borderRadius(25)
                Image($r("app.media.zjl"))
                  .height(15)
                  .borderRadius(25)
                  .margin({right:2})
                Text("等5位朋友")
                  .fontSize(12)
                Circle()
                  .width(5)
                  .height(5)
                  .colorBlend(Color.Red)
                  .margin({left:2})
              }
              .height("100%")
              .width("100%")
            }
            .fontColor(Color.Gray)
            .backgroundColor(Color.White)
            .borderColor(Color.Gray)
            .borderWidth(1)
            .width(120)
            .height(25)
          }
          .alignItems(VerticalAlign.Top)
          .layoutWeight(1)
          .width("100%")
        }
        .width(300)
        .height("100%")
      }
      .alignItems(VerticalAlign.Top)
      .width("100%")
      .height(110)
    }
    .width("100%")
    .height(130)
  }
}

@Preview
@CustomDialog
struct body1_image{
  c:CustomDialogController
  @State index:number=0
  @Link image:ResourceStr
  build() {
    Column(){
      Grid(){
        ForEach(image_head,(i:ResourceStr,index:number)=>{
          GridItem(){
            Image(i)
              .height(70)
              .width(70)
              .margin(15)
              .onClick(()=>{
                this.index=index
              })
          }
          .borderWidth(2)
          .borderColor(this.index==index?Color.Yellow:"#DCDCDC")
        })
      }
      .height(290)
      .columnsTemplate("1fr 1fr 1fr")
      Blank()
      Row(){
        Button("退出").onClick(()=>{
          this.c.close()
        })
          .margin({left:15,bottom:5})
        Blank()
        Button("确认").onClick(()=>{
          this.image=image_head[this.index]
          this.c.close()
        })
          .margin({right:15,bottom:5})
      }
      .height(50)
      .width("100%")
    }
    .width("90%")
    .height("70%")
  }
}

@Component
export struct pubic_1{
  @State message:message_info={re:"",text:''}
  build() {
    Row(){
      Image($r(this.message.re))
        .height(30)
        .margin({left:20})
        .aspectRatio(1)
      Text(this.message.text)
        .fontSize(17)
        .margin({left:15})
      Blank()
      Image($r("app.media.ic_public_arrow_right"))
        .fillColor(Color.Gray)
        .margin({left:5,top:3})
        .height(25)
        .margin({right:15})
        .onClick(()=>{
          router.pushUrl({url:"pages/error"})
        })
    }
    .stateStyles({
      pressed:{
        .backgroundColor("#ff8c7f7f")
      },
      normal:{
        .backgroundColor("#fff")
      }
    })
    .height(50)
    .width("100%")
  }
}