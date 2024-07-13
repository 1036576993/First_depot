export interface user_interface{
  user:string,
  password:string
}
export class user_class implements user_interface{
  user: string=""
  password: string=""
}
//用户验证身份类型

export interface miniImage{
  image:ResourceStr
  text:string
}
//page1里小图标的数据类型
export interface BigImage{
  image:ResourceStr
  text:string
}
//page1里大图标的数据类型

export interface shopping{
  status: number
  code: number
  data: shopping_image[]
}

export interface shopping_image{
  title:string,
  items:shopping_text[]
}

export interface shopping_text{
  title:string,
  gid:string
  cid:string
  price:number
  image:ResourceStr
}
//以上三层为网络接口数据
export interface user_info{
  user:string
  avatar:ResourceStr
  state:string
}
//用户具体数据

export interface message_info{
  re:string
  text:string
}