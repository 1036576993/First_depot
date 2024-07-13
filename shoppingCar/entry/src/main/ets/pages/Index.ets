import { promptAction, router } from '@kit.ArkUI'
import { user_data, user_Info } from '../data/data';
import { user_info, user_interface } from '../interface/interface';


@Entry
@Component
struct Index {
  aboutToAppear(): void {
    AppStorage.setOrCreate<user_interface[]>("user_data", user_data) //开始自动录入用户信息
    AppStorage.setOrCreate<user_info[]>("userInfo",user_Info)        //开始自动录入用户数据
    this.user_new_data = AppStorage.get<user_interface[]>("user_data")! //初始化数据
  }

  onPageShow(): void { //返回页面后更新注册数据
    this.user_new_data = AppStorage.get<user_interface[]>("user_data")!
  }

  @State user: string = '' //用户名
  @State password: string = '' //密码
  user_new_data: user_interface[] = [] //全部用户数据
  @State login: boolean = false //核实用户名密码是否正确

  select_user(user: string, password: string) { //核实用户名，密码
    this.user_new_data.forEach(element => {
      if (element.user == user && element.password == password) {
        this.login = true
      }
    });
  }

  enroll() { //跳转注册
    router.pushUrl({
      url: "pages/enroll"
    })
  }

  build() {
    Row() {
      Column({ space: 15 }) {
        TextInput({ placeholder: "请输入用户名", text: $$this.user })
          .backgroundColor("#ffc8c7c7")
          .opacity(0.8)
        TextInput({ placeholder: "请输入密码", text: $$this.password }).type(InputType.Password)
          .backgroundColor("#ffc8c7c7")
          .opacity(0.8)
        Button("登录")
          .onClick(() => {
            this.select_user(this.user, this.password)
            if (this.login) {
              AppStorage.setOrCreate<string>("user", this.user) //当前登录用户
              router.replaceUrl({ url: "pages/main" }) //跳转核心页面，销毁当前页面
            } else {
              this.user = ''
              this.password = ''
              promptAction.showToast({ message: "用户名或密码错误" })
            }
          })
          .width('100%')
        Row() {
          Blank()
          Text("创建新用户")
            .fontColor(Color.Gray)
            .onClick(() => {
              this.enroll()
            })
        }
        .width("100%")
      }
      .backgroundImage($r("app.media.input_background"))
      .backgroundImageSize(ImageSize.Cover)
      .justifyContent(FlexAlign.Center)
      .padding(15)
      .width('100%')
      .height("100%")
    }
    .height('100%')
  }
}