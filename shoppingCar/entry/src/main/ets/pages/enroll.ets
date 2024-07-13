import { promptAction, router } from '@kit.ArkUI'
import { user_Info } from '../data/data'

import { user_info, user_interface } from '../interface/interface'

@Entry
@Component
struct Enroll {
  @State user: string = ''                      //用户名
  @State password:string=''                     //密码
  user_data:user_interface[]=AppStorage.get("user_data")! //总数据，用于确认是否重复
  @State state:boolean=false                    //输入数据是否重复
  enroll_data(){                                //添加数据
    this.user_data.push({user:this.user,password:this.password})
    let x:user_info[]=user_Info
    x.push({user:this.user,avatar:'',state:''}) //创建新用户初始数据
    AppStorage.setOrCreate("userInfo",x)
    AppStorage.setOrCreate<user_interface[]>("user_data",this.user_data)
  }
  build() {
      Column({space:15}) {
        Row(){
          Image($r("app.media.reply"))
            .fillColor(Color.White)
            .height(35)
            .width(35)
            .margin(5)
            .onClick(()=>{
              router.back()
            })
        }
        .width("100%")
        Column()
          .height(220)
        TextInput({placeholder:"请输入用户名",text:$$this.user})
          .backgroundColor("#ffc8c7c7")
          .opacity(0.8)
        TextInput({placeholder:"请输入密码",text:$$this.password}).type(InputType.Password)
          .backgroundColor("#ffc8c7c7")
          .opacity(0.8)
        Button("注册")
          .onClick(()=>{
            this.user_data.forEach(element => {
              if(element.user==this.user){
                this.state=true
              }
            });
            if (this.state) {
              promptAction.showToast({message:"该用户已存在"})
            }else if(this.user==''||this.password==''){
              this.user=''
              this.password=''
              promptAction.showToast({message:"用户名或密码未填写"})
            }else {
              this.enroll_data()
              promptAction.showToast({message:"注册成功"})
              router.back()
            }
          })
          .width('100%')
      }
      .backgroundImage($r("app.media.enroll_background"))
      .backgroundImageSize(ImageSize.Cover)
      .width('100%')
      .height("100%")
  }
}