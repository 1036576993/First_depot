import { BigImage, miniImage, user_class, user_info,user_interface} from '../interface/interface'

export let user_data:user_interface[]=[{user:"ky",password:"123456"},{user:"lyh",password:"123456"},{user:"xz",password:"123456"}]
//用户登录数据
export let image_swiper:ResourceStr[]=[$r("app.media.swiper5"),$r("app.media.swiper1"),$r("app.media.swiper2"),$r("app.media.swiper3"),$r("app.media.swiper4")]
//page1里轮播图数据
export let miniImage_data:miniImage[]=[{image:$r("app.media.a1"),text:"喜欢"},{image:$r("app.media.a2"),text:"收藏"},{image:$r("app.media.a3"),text:"消息"},{image:$r("app.media.a4"),text:"购物车"},{image:$r("app.media.a5"),text:"标签"},{image:$r("app.media.a6"),text:"优惠卷"},{image:$r("app.media.a7"),text:"特别关注"},{image:$r("app.media.a8"),text:"收藏"}]
//page1小图标数据
export let bigImage_data:BigImage[]=[{image:$r("app.media.b1"),text:"智能耳机"},{image:$r("app.media.b2"),text:"廉价用品"},{image:$r("app.media.b3"),text:"时尚服装"},{image:$r("app.media.b4"),text:"特色乐器"},{image:$r("app.media.b5"),text:"实用家居"},{image:$r("app.media.b6"),text:"酷炫跑鞋"}]
//page1大图标数据
export let user_Info:user_info[]=[{user:"xz",avatar:$r("app.media.zjl"),state:"空闲"},{user:"lyh",avatar:$r("app.media.dzq"),state:"暂离"},{user:"ky",avatar:$r("app.media.ljj"),state:"繁忙"}]
//用户数据
export let image_head:ResourceStr[]=[$r("app.media.ljj"),$r("app.media.dzq"),$r("app.media.rqx"),$r("app.media.txl"),$r("app.media.yyh"),$r("app.media.zhj"),$r("app.media.zjl")]
//头像数据