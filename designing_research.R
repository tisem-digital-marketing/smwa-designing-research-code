#' designing_research.R
#'
#' What's in this file:
#'  * Code snippets from lecture 2
#'

# --- Libraries --- #
library(readr)
library(dplyr)
library(ggplot2)
library(broom)
library(infer)
library(ggrepel)

# --- Brown Hair and Wages ---- # 

# Simulate the DGP
set.seed(YOUR_CODE_HERE)

df <- 
    YOUR_CODE_HERE

# Plotting income by hair color
df %>% 
    filter(Hair == "Brown") %>%
    ggplot(aes(x = logIncome, linetype = Hair)) +
    stat_density(geom = 'line', size = 1) +
    stat_density(data = df %>% filter(Hair == "Other Color"), 
                 geom = 'line', size = 1) +
    theme_bw() + 
    labs(x = "Log Income", y = "Density") + 
    theme(text         = element_text(size = 16),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16),
          legend.position = c(.2,.8),
          legend.background = element_rect())

# Learning about the DGP -- going in blind
df %>%
    YOUR_CODE_HERE

# Learning about the DGP -- using what we know
df %>%
    YOUR_CODE_HERE

# Simulation
# function to simulate data
sim_data = function(){
    df <- 
        tibble(College = runif(5000) < .3) %>%
        mutate(Hair = case_when(
            runif(5000) < .2+.8*.4*(!College) ~ "Brown",
            TRUE ~ "Other Color"
        ),
        logIncome = .1*(Hair == "Brown") + 
            .2*College + rnorm(5000) + 5 
        )
    return(df)
}

# Simulate it!
set.seed(42)
all_data <- tibble::enframe(replicate(n = 1000, 
                                      sim_data(), 
                                      simplify = FALSE)
)

all_data <- tidyr::unnest(all_data, cols = c(value))

# Conditional Mean Using all Data
whole_pop <-
    all_data %>%
    group_by(name, Hair) %>%
    summarize(log_income = round(mean(logIncome),3)) %>%
    tidyr::pivot_wider(names_from = Hair, values_from = log_income) %>%
    janitor::clean_names() %>%
    ungroup() %>%
    mutate(all_dif = brown - other_color)

# Conditional Mean Using college students only 
college_only <-
    all_data %>%
    filter(College) %>%
    group_by(name, Hair) %>%
    summarize(log_income = round(mean(logIncome),3)) %>%
    tidyr::pivot_wider(names_from = Hair, values_from = log_income) %>%
    janitor::clean_names() %>%
    ungroup() %>%
    mutate(college_dif = brown - other_color)

# Join the data to make the plot easier to make
comparison <-
    whole_pop %>%
    inner_join(college_only, by = c("name"))

# plot estimates for each simulation!
comparison %>%
    ggplot() + 
    stat_density(aes(x=all_dif), geom = 'line', size = 1, color = "blue") +
    stat_density(aes(x=college_dif), geom = 'line', size = 1, color = "purple") +
    geom_vline(xintercept = 0.1, color = "red", linetype = 2) + 
    theme_bw() + 
    labs(x = "Effect of Brown Hair", y = "Density") + 
    theme(text         = element_text(size = 16),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16),
          #legend.position = c(.2,.8),
          legend.background = element_rect())

# --- Avocados --- #
# Load and select datapoints 
avocados <- 
    YOUR_CODE_HERE %>%
    janitor::clean_names() %>%
    filter(region == "California",
           type == "conventional")

# Plot all avocados data
ggplot(avocados, 
       aes(y = YOUR_CODE_HERE,
           x = YOUR_CODE_HERE)
       ) + 
    geom_point(size = 1)+
    theme_bw() + 
    theme(text         = element_text(size = 16),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16)
    ) +
    labs(y = "Total Avocados Sold (Millions)",
         x = "Average Avocado Price",
         title = "",
         caption = "Data from Hass Avocado Board\nc/o https://www.kaggle.com/datasets/neuromusic/avocado-prices")

# Plot for two data points from consecutive weeks
avocados %>%
    mutate(isolate = row_number() %in% 4:5) %>%
    ggplot(aes(y = total_volume/1e6, 
               x = average_price, 
               alpha = isolate)
           ) + 
    geom_point(size = 2)+
    theme_bw()+
    guides(alpha = "none") + 
    scale_alpha_manual(values = c(0,1)) +
    geom_label_repel(aes(label = as.character(date)), direction = 'y') +
    theme(text         = element_text(size = 16),
          axis.title.x = element_text(size = 16),
          axis.title.y = element_text(size = 16)
    ) +
    labs(y = "Total Avocados Sold (Millions)",
         x = "Average Avocado Price",
         title = "",
         caption = "Data from Hass Avocado Board\nc/o https://www.kaggle.com/datasets/neuromusic/avocado-prices")