module UsernameNotReservedValidator::ReservedNames
  def self.list
    RESERVED_NAMES
  end

  RESERVED_NAMES = %w[
    0
    about
    account
    activity
    ad
    add
    admin
    all
    alpha
    analysis
    api
    app
    application
    archive
    article
    as
    asct
    asset
    atom
    auth
    balancer-manager
    beta
    blog
    book
    bookmark
    bot
    bug
    business
    by
    calendar
    call
    captcha
    career
    cart
    case
    category
    cgi
    cgi-bin
    code
    comment
    community
    company
    config
    connect
    connect
    contact
    contest
    contribute
    corp
    count
    create
    css
    dashboard
    data
    default
    delete
    design
    destroy
    dev
    developer
    diagram
    diary
    dict
    dictionary
    die
    dir
    dist
    doc
    download
    edit
    else
    empty
    end
    entry
    error
    eval
    event
    exit
    explore
    faq
    feature
    feed
    file
    find
    first
    flash
    forgot
    form
    forum
    friend
    game
    get
    gift
    graph
    group
    guest
    help
    home
    hostmaster
    howto
    i
    icon
    id
    if
    image
    img
    index
    info
    information
    inquiry
    is
    issue
    item
    javascript
    join
    js
    json
    jump
    language
    last
    ldap-status
    legal
    license
    log
    login
    logout
    mail
    maintenance
    manual
    master
    me
    member
    message
    mobile
    msg
    my
    nan
    navi
    navigation
    new
    news
    notify
    null
    oauth
    oauth2
    off
    offer
    official
    old
    on
    or
    order
    organization
    out
    owner
    page
    password
    phone
    photo
    plan
    policy
    popular
    portal
    post
    postmaster
    pr
    premium
    press
    price
    privacy
    private
    product
    profile
    project
    public
    purpose
    put
    query
    ranking
    read
    recent
    recruit
    register
    release
    remove
    report
    repository
    req
    request
    reset
    roc
    root
    rss
    rule
    sag
    school
    script
    search
    secure
    security
    select
    self
    server-info
    server-status
    service
    session
    setting
    share
    shop
    show
    signin
    signout
    signup
    site
    sitemap
    source
    spec
    special
    src
    start
    state
    static
    status
    store
    style
    stylesheet
    support
    svn
    swf
    switch
    sys
    system
    tag
    term
    test
    theme
    then
    thread
    tool
    top
    topic
    tour
    tutorial
    tux
    undef
    update
    update
    upload
    usage
    user
    ver
    version
    video
    watch
    webmaster
    when
    widget
    wiki
    word
    www
    xml
    year
  ]
end
