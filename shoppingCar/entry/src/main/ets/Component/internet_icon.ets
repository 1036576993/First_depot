import { shopping_image, shopping_text } from '../interface/interface'

@Component
export struct internet_icon{
  message:shopping_text={title:"暂无",gid:"0",price:0,image:"",cid:""}
  dialog:CustomDialogController = new CustomDialogController({          //具体属性弹窗
    builder:internet_dialog({
      cid:this.message.cid,
      gid:this.message.gid,
      text:this.message.title
    })
  })
  build() {
    Column(){
      Stack(){
        Image("http:"+this.message.image)
          .height(110)
          .width(110)
          .borderRadius(2)
      }
      .height(120)
      .width(120)
      .alignContent(Alignment.TopStart)
      Column(){
        Text(this.message.title+": ").fontWeight(FontWeight.Bold)
          .maxLines(2)
        Text("￥"+this.message.price).fontColor(Color.Red)
      }
      .height(70)
    }
    .onClick(()=>{
      this.dialog.open()
    })
    .height(190)
    .width(150)
  }
}

@CustomDialog
export struct internet_dialog{
  con:CustomDialogController
  cid:string='123'
  gid:string='123'
  text:string='123'
  build() {
    Column(){
      Text("  "+this.text)
        .fontSize(20)
        .margin(15)
      Blank()
      Row(){
        Text("当前产品cid:"+this.cid)
        Blank()
        Text("当前产品gid:"+this.gid)
      }
      .width("100%")
    }
    .alignItems(HorizontalAlign.Start)
    .borderRadius({topLeft:25,topRight:25})
    .height("50%")
    .width("98%")
  }
}