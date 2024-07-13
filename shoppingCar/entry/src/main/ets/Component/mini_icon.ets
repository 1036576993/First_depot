@Component
export struct  mini_icon{
  image:ResourceStr=""
  text:string=''
  build() {
    Column(){
      Image(this.image)
        .height(23)
        .width(23)
      Text(this.text)
        .margin({left:3,top:3})
    }
  }
}