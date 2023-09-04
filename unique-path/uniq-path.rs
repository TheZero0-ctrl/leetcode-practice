fn unique_path2d(m: i32, n: i32) -> i32 {
    let mut dp:Vec<Vec<i32>> = vec![vec![1; n as usize]; m as usize];

    for i in 1..m as usize {
        for j in 1..n as usize {
            dp[i][j] = dp[i-1][j] + dp[i][j-1];
        }
    }
    dp[(m-1) as usize][(n-1) as usize]
}

fn unique_path2d(m: i32, n: i32) -> i32 {
    let mut current_row:Vec<i32> = vec![1; n as usize];
    let mut prev_row:Vec<i32> = vec![1; n as usize];

    for i in 1..m as usize {
        for j in 1..n as usize {
            current_row[j] = current_row[j - 1] + prev_row[j];
        }
        std::mem::swap(&mut current_row, &mut prev_row);
    }
    prev_row[(n-1) as usize]
}