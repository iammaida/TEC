class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItems = baseUrl + "home/?command=index";
  static const getArticleList =
      baseUrl + "article/get.php?command=new&user_id=1";
  static const getArticlewithId = baseUrl +
      "article/get.php?command=get_articles_with_tag_id&tag_id=&user_id=";
}
