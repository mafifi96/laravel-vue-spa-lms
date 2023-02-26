import Dashboard  from '../Components/Admin/pages/Dashboard.vue'
import Courses from '../Components/Admin/pages/course/courses.vue'
import Course from '../Components/Admin/pages/course/course.vue'
import CourseCreate from '../Components/Admin/pages/course/create.vue'
import CourseEdit from '../Components/Admin/pages/course/edit.vue'
import Students from '../Components/Admin/pages/student/students.vue'
import Student from '../Components/Admin/pages/student/student.vue'
import StudentCourse from '../Components/Admin/pages/student/StudentCourse.vue'
import StudentEdit from '../Components/Admin/pages/student/edit.vue'
import StudentCreate from '../Components/Admin/pages/student/create.vue'
import Levels from '../Components/Admin/pages/level/levels.vue'
import Level from '../Components/Admin/pages/level/level.vue'
import LevelCreate from '../Components/Admin/pages/level/create.vue'
import LevelEdit from '../Components/Admin/pages/level/edit.vue'


const routes = [
    {
        path: '/dashboard',
        name: 'dashboard',
        component: Dashboard,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/courses',
        name: 'courses',
        component: Courses,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/courses/:id(\\d+)',
        name: 'course',
        component: Course,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/courses/create',
        name: 'course.create',
        component: CourseCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/courses/:id(\\d+)/edit',
        name: 'course.edit',
        component: CourseEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/students',
        name: 'students',
        component: Students,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/students/:id(\\d+)',
        name: 'student',
        component: Student,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/courses/:cid(\\d+)/students/:sid(\\d+)',
        name: 'StudentCourse',
        component: StudentCourse,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/students/create',
        name: 'students.create',
        component: StudentCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/students/:id(\\d+)/edit',
        name: 'students.edit',
        component: StudentEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/levels',
        name: 'levels',
        component: Levels,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/levels/:id(\\d+)',
        name: 'level',
        component: Level,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/levels/create',
        name: 'levels.create',
        component: LevelCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/levels/:id(\\d+)/edit',
        name: 'levels.edit',
        component: LevelEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },

];

export default routes
