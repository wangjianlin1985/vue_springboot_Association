// 首页
<template>
  <div class="index">
    <!-- 轮播 -->
    <Carousel autoplay loop :height="450">
      <CarouselItem>
        <img src="../assets/img/carousel_1.jpg" alt="轮播图1" class="carouselImg" />
      </CarouselItem>
      <CarouselItem>
        <img src="../assets/img/carousel_2.jpg" alt="轮播图2" class="carouselImg" />
      </CarouselItem>
      <CarouselItem>
        <img src="../assets/img/carousel_3.jpg" alt="轮播图3" class="carouselImg" />
      </CarouselItem>
      <CarouselItem>
        <img src="../assets/img/carousel_4.jpg" alt="轮播图4" class="carouselImg" />
      </CarouselItem>
    </Carousel>

    <Spin size="large" fix v-if="spinShow"></Spin>

    <!-- 信息展示 -->
    <div class="main">
      <!-- 栅格 -->
      <Row type="flex" justify="space-between" class="code-row-bg row1" style="margin-top:20px;">
        <!-- 社团列表 -->
        <Col span="7">
          <Card class="card" style="overflow:hidden;">
            <div style="text-align:center;">
              <img src="../assets/img/index_item_1.jpg" alt="社团列表" class="cardImg" />
            </div>
            <!-- 标题 -->
            <div class="item_title">
              <!-- 蓝色竖条 -->
              <div class="blue_column"></div>
              <span>社团世界</span>
              <a href="/teams" class="a_button" style="float:right;">MORE</a>
            </div>
            <ul style="margin-top:10px;">
              <li v-for="item in teamList" :key="item.id">
                <img src="../assets/img/list_item_head.png" alt="·" style="width:15px;" />
                <router-link
                  :to="{path:'team_detail',query:{itemId:item.id}}"
                  class="teamname"
                >{{item.teamname}}</router-link>
                <span style="float:right;">现有人数:{{item.persons}}</span>
              </li>
            </ul>
          </Card>
        </Col>
        <Col span="7">
          <Card class="card">
            <div style="text-align:center;">
              <img src="../assets/img/index_item_2.jpg" alt="活动列表" class="cardImg" />
            </div>
            <!-- 标题 -->
            <div class="item_title">
              <!-- 蓝色竖条 -->
              <div class="blue_column"></div>
              <span>热门活动</span>
              <a href="/activity" class="a_button" style="float:right;">MORE</a>
            </div>
            <ul style="margin-top:10px;">
              <li v-for="item in activityList" :key="item.id">
                <img src="../assets/img/list_item_head.png" alt="·" style="width:15px;" />
                <router-link
                  class="teamname"
                  :to="{path:'activity_detail',query:{activityId:item.id}}"
                >{{item.activityName}}</router-link>
                <span class="ac_time">{{item.createTime}}</span>
              </li>
            </ul>
          </Card>
        </Col>
        <Col span="7">
          <Card class="card">
            <div style="text-align:center;">
              <img src="../assets/img/index_item_3.png" alt="关于我们" class="cardImg" />
            </div>
            <!-- 标题 -->
            <div class="item_title">
              <!-- 蓝色竖条 -->
              <div class="blue_column"></div>
              <span>关于我们</span>
              <a href="/about_us" class="a_button" style="float:right;">MORE</a>
            </div>
            <div style="width: 90%;margin: 10px auto;">
              <p class="about_us_content">
                社团联盟系统旨在为高校提供社团管理的平台，为学生、社团管理者、学校管理者提供多方面服务，
                规范、高效地管理高校社团。学生可通过系统了解社团、查询社团、加入社团，并可以获取社团通知...
              </p>
            </div>
          </Card>
        </Col>
      </Row>
    </div>
  </div>
</template>

<script>
import TeamService from "../assets/js/team";
import ActivityService from "../assets/js/activity";
export default {
  name: "index",
  data() {
    return {
      teamList: [], //社团列表
      params: {
        pageCurrent: 1,
        pageSize: 6,
        teamname: ""
      }, //获取社团列表的参数
      spinShow: false, //缓冲显示
      ac_params: {
        current: 1,
        size: 6,
        teamId: -1
      }, //获取活动列表的参数
      activityList: [] //活动列表
    };
  },
  methods: {
    //获取社团列表
    getTeams() {
      this.spinShow = true; //加载图案显示
      TeamService.getAllTeam(this.params).then(res => {
        if (res.code == 0) {
          this.teamList = res.data.records;
        } else {
          this.$Message.error(res.msg);
        }
        this.spinShow = false;
      });
    },
    // 获取活动列表
    getActivity() {
      this.spinShow = true;
      ActivityService.getActivity(this.ac_params).then(res => {
        if (res.code == 0) {
          this.activityList = res.data.records;
        } else {
          this.$Message.error(res.msg);
        }
        this.spinShow = false;
      });
    }
  },
  created() {
    this.getTeams();
    this.getActivity();
  }
};
</script>


<style lang="scss">
/* 轮播图 */
.index .carouselImg {
  width: 100%;
  height: 450px;
}
/* 信息卡片 */
.index .main .row1 .card {
  width: 100%;
  height: 310px;
}
.index .main .row1 .card .cardImg {
  height: 100px;
  margin: 0 auto;
}

.card .item_title span {
  font-size: 20px;
  vertical-align: bottom;
  font-weight: bold;
  margin-left: 10px;
}
.card li .teamname {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  color: $base_color;
  display: inline-block;
  width: 60%;
  vertical-align: bottom;
}
.card li .ac_time {
  width: 80px;
  overflow: hidden;
  display: inline-block;
  height: 20px;
  float: right;
}
.about_us_content {
  height: 130px;
  text-overflow: ellipsis;
  overflow: hidden;
  text-indent: 2em;
  line-height: 26px;
}
</style>
