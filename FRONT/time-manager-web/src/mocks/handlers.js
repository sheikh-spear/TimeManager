import { rest } from 'msw'
export const handlers = [
    // Handles a POST /login request
    rest.post('/api/users/sign_in', (req, res, ctx) => {
        // Persist user's authentication in the session
        localStorage.setItem('is-authenticated', true);
        return res(
            // Respond with a 200 status code
            ctx.status(200),
            ctx.json({
                "data": {
                    "user": {
                        "email": "user1@email.com",
                        "id": "600db4ce-9f78-4494-be65-404bfba45d82"
                    }
                }
            })
        )
        //Error case here
        // return res(
        //     // Respond with a 500 status code
        //     ctx.status(403),
        //     ctx.json({
        //         "errors": {
        //             "detail": "Wrong email or password"
        //         }
        //     })
        // )
    }),
    rest.get('/api/users', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({
                email: "test@mail.com",
                is_manager: true,
                is_general_manager: true,
                id: '057231ee-91a9-404f-97ea-0f1a344de529'
            })
        )
    }),
    // Handles a GET /user request
    rest.get('/api/users/list', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({
                "data": {
                    "users":
                        [
                            {
                                email: "test@mail.com",
                                is_manager: true,
                                is_general_manager: true,
                                id: '057231ee-91a9-404f-97ea-0f1a344de529'
                            },
                            {
                                email: "test@mail.com",
                                is_manager: false,
                                is_general_manager: false,
                                id: '057231ee-91a9-404f-97ea-0f1a344de526'
                            },
                            {
                                email: "test@mail.com",
                                is_manager: true,
                                is_general_manager: false,
                                id: '057231ee-91a9-404f-97ea-0f1a344de527'
                            },
                            {
                                email: "test@mail.com",
                                is_manager: false,
                                is_general_manager: false,
                                id: '057231ee-91a9-404f-97ea-0f1a344de520'
                            },
                            {
                                email: "test@mail.com",
                                is_manager: true,
                                is_general_manager: false,
                                id: '057231ee-91a9-404f-97ea-0f1a344de528'
                            }
                        ]
                }
            })
        )
    }),
    rest.get('/api/teams/list', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({
                "teams":
                    [
                        {
                            "id": "45678",
                            "name": "first",
                            "users":
                                [
                                    {
                                        email: "test@mail.com",
                                        is_manager: true,
                                        is_general_manager: false,
                                        id: '057231ee-91a9-404f-97ea-0f1a344de528'
                                    },
                                    {
                                        email: "test@mail.com",
                                        is_manager: false,
                                        is_general_manager: false,
                                        id: '057231ee-91a9-404f-97ea-0f1a344de526'
                                    },
                                ]
                        },
                        {
                            "id": "456789",
                            "name": "second",
                            "users":
                                [
                                    {
                                        email: "test@mail.com",
                                        is_manager: true,
                                        is_general_manager: false,
                                        id: '057231ee-91a9-404f-97ea-0f1a344de527'
                                    },
                                    {
                                        email: "test@mail.com",
                                        is_manager: false,
                                        is_general_manager: false,
                                        id: '057231ee-91a9-404f-97ea-0f1a344de520'
                                    },
                                    {
                                        email: "test@mail.com",
                                        is_manager: false,
                                        is_general_manager: false,
                                        id: '057231ee-91a9-404f-97ea-0f1a344de528'
                                    }
                                ]
                        }
                    ]
            })
        )
    }),
    // Handles request to GET the workingtimes from the user id 1
    rest.get('/api/workingtime/b6d4-r4bf...', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({
                "data": [
                    { start: new Date("2020-10-23 09:05:00"), end: new Date("2020-10-23 14:02:00") },
                    { start: new Date("2020-10-23 10:02:00"), end: new Date("2020-10-23 12:02:00") },
                    { start: new Date("2020-10-24 09:02:00"), end: new Date("2020-10-24 14:02:00") },
                    { start: new Date("2020-10-24 15:06:02"), end: new Date("2020-10-24 18:15:00") },
                    { start: new Date("2020-10-25 09:02:00"), end: new Date("2020-10-25 14:02:00") },
                    { start: new Date("2020-10-25 10:02:00"), end: new Date("2020-10-25 12:02:00") },
                    { start: new Date("2020-11-02 09:01:00"), end: new Date("2020-11-02 13:53:00") },
                    { start: new Date("2020-11-02 14:12:00"), end: new Date("2020-11-02 17:02:00") }
                ]
            })
        )
    }),
    rest.get('/api/users/punch_clock', (req, res, ctx) => {
        //Start/Stop the clock
        return res(
            ctx.status(200),
            ctx.json({
                message: 'Start'
            })
        )
    }),
    rest.get('/api/users/profile', (req, res, ctx) => {
        return res(
            ctx.status(200),
            ctx.json({
                status: true,
                email: 'user@mail.com'
            })
        )
    })

]