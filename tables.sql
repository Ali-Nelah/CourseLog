USE CourseLog;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);



CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    semester VARCHAR(20),
    credits INT CHECK (credits > 0),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE course_repos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    progress_percentage INT DEFAULT 0,
    final_grade DECIMAL(5,2),
    repo_status VARCHAR(30) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (user_id)
    REFERENCES users(id),

    FOREIGN KEY (course_id)
    REFERENCES courses(id),

    UNIQUE (user_id, course_id),

    CHECK (progress_percentage BETWEEN 0 AND 100),

    CHECK (
        repo_status IN (
            'active',
            'completed',
            'paused',
            'dropped'
        )
    ),

    CHECK (
        final_grade IS NULL
        OR final_grade BETWEEN 0 AND 100
    )
);


CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repo_id INT NOT NULL,
    user_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    content TEXT NOT NULL,
    progress_status VARCHAR(30) DEFAULT 'in_progress',
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (repo_id)
    REFERENCES course_repos(id),

    FOREIGN KEY (user_id)
    REFERENCES users(id),

    CHECK (
        progress_status IN (
            'started',
            'in_progress',
            'completed',
            'improved',
            'blocked'
        )
    )
);



CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    file_url VARCHAR(255) NOT NULL,
    file_type VARCHAR(50),
    repo_id INT NOT NULL,
    uploaded_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (repo_id)
    REFERENCES course_repos(id)
);


CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    repo_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    due_date DATE,
    status VARCHAR(30) DEFAULT 'not_started',
    grade DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (repo_id)
    REFERENCES course_repos(id),

    CHECK (
        status IN (
            'not_started',
            'in_progress',
            'completed',
            'late',
            'cancelled'
        )
    ),

    CHECK (
        grade IS NULL
        OR grade BETWEEN 0 AND 100
    )
);



CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (user_id)
    REFERENCES users(id),

    FOREIGN KEY (post_id)
    REFERENCES posts(id)
);

CREATE TABLE likes (
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (user_id)
    REFERENCES users(id),

    FOREIGN KEY (post_id)
    REFERENCES posts(id),

    PRIMARY KEY (user_id, post_id)
);



CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),

    FOREIGN KEY (follower_id)
    REFERENCES users(id),

    FOREIGN KEY (followee_id)
    REFERENCES users(id),

    PRIMARY KEY (follower_id, followee_id),

    CHECK (follower_id != followee_id)
);


