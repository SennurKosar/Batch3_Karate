function fn(){
var config = {
          apiURL: 'http://eurotech.study'
      }

//      karate.configure('connectTimeout', 5000);
//      karate.configure('readTimeout', 5000);
      karate.configure('logPrettyRequest', true);
      karate.configure('logPrettyResponse', true);
      karate.configure('ssl', true);

     return config;
}