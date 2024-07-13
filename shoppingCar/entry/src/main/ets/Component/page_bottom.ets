@Builder
export function  page_tab(image:ResourceStr,text:string,state:boolean){
    Column(){
      Image(image)
        .height(30)
        .width(30)
        .fillColor(state?Color.Blue:Color.Black)
      Text(text)
        .fontSize(state?Color.Blue:Color.Black)
    }
    .width("30%")
    .height('100%')

}