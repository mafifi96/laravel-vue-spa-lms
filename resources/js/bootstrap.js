import _ from 'lodash';
window._ = _;

import axios from 'axios';
window.axios = axios;

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/* window.axios.defaults.headers.common = {
    'Authorization': `Bearer ${res.data.token}`
}
 */
window.axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

window.axios.defaults.withCredentials = true;

 window.axios.interceptors.response.use(function (response) {

    return response;
  }, function (error) {

    if(error.response.status == 401 || error.response.status == 409){

        window.localStorage.clear()
        window.location = "/"

    }

    return Promise.reject(error);
  });
