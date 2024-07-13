@Component
export struct  big_icon{
  image:ResourceStr=""
  text:string=''
  build() {
    Column(){
      Stack(){
        Image(this.image)
          .height(160)
          .width(160)
          .borderRadius(5)
        Text(this.text)
      }
    }
  }
}