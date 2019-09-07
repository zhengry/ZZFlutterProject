
const urls = {
  'channelList':'https://api.apiopen.top/musicBroadcasting',
  'channelDetail':'https://api.apiopen.top/musicRankingsDetails',

};

class URLManager{
  static String get channelList => urls['channelList'];
  static String get channelDetail => urls['channelDetail'];
}