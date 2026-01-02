# E-Commerce Funnel Analysis & Conversion Optimization

<img width="1952" height="969" alt="funnel_dashboard" src="https://github.com/user-attachments/assets/8346dd96-d59f-4f91-8b30-17a6a747915e" />

An end-to-end **product analytics and conversion funnel analysis project** built on a synthetic e-commerce dataset.
This project demonstrates how a **data analyst approaches funnel optimization using SQL-first analysis**, followed by Python validation, explainable modeling, and an executive-ready interactive dashboard.

The focus is on **understanding user behavior, identifying drop-offs, and translating data into actionable business insights**.

---

## Features

* SQL-first funnel construction and analysis
* Explicit funnel definition (View → Cart → Wishlist → Purchase)
* User-level conversion tracking and drop-off analysis
* Segment-wise conversion analysis (city, gender, cohort)
* Product category conversion benchmarking
* Time-based conversion trend analysis
* Explainable conversion modeling (logistic regression)
* Conversion probability scoring per user
* Interactive Dash dashboard with executive-grade UI

---

## System Architecture

```
Raw E-commerce Data (CSV)
   |
   v
Event Cleaning & Validation (SQL)
   |
   v
User-Level Funnel Construction
   |
   v
Funnel Metrics & Drop-Off Analysis
   |
   v
Segment & Category Analysis
   |
   v
Time-Based Conversion Trends
   |
   v
Explainable Conversion Modeling (Python)
   |
   v
Interactive Analytics Dashboard (Dash + Plotly)
```

---

## Analytical Approach

### Funnel Definition

The purchase funnel is explicitly defined as:

```
View → Cart → Wishlist (Assistive) → Purchase
```

Key analyst decisions:

* Users can repeat events
* Conversion is defined as **at least one purchase**
* Wishlist is treated as a supporting signal, not a mandatory step

---

### SQL-First Analysis

SQL is used as the primary analysis layer to ensure:

* Transparency
* Reproducibility
* Business-friendly logic

Core SQL outputs include:

* User-level funnel flags
* Overall funnel conversion rates
* Stage-wise drop-off metrics
* Segment-level conversion tables
* Category-level performance benchmarks
* Weekly and monthly conversion trends

---

### Explainable Conversion Modeling

A logistic regression model is used to estimate conversion likelihood using interpretable behavioral features:

* Number of product views
* Cart additions
* Wishlist additions
* User tenure

The model is **standardized** to enable coefficient comparison and interpretation.

Rather than optimizing for predictive accuracy, the model is used to:

* Explain behavioral drivers of conversion
* Validate SQL-level insights
* Generate conversion probability scores

---

## Dashboard

The interactive Dash dashboard provides:

* Executive KPI summary
* Funnel overview with drop-off visualization
* Conversion trends over time
* Category-level conversion comparison
* Explainable model coefficients
* Conversion probability distribution
* Behavioral scatter plots (engagement vs intent)

The dashboard is designed to resemble **internal analytics tools used by product and growth teams**, with a focus on clarity and decision support.

---

## Data

### Dataset Description

The project uses an **e-commerce dataset** consisting of:

* Users
* Products
* Orders and order items
* Reviews
* Event-level behavioral logs

All data is provided in CSV format to ensure full reproducibility.

### Tables

* `users.csv` – User demographics and signup information
* `products.csv` – Product catalog with pricing and ratings
* `orders.csv` – Order-level transactions
* `order_items.csv` – Product-level purchase details
* `reviews.csv` – User reviews and ratings
* `events.csv` – User behavioral events (view, cart, wishlist, purchase)

---

## Project Structure

```
ecommerce-funnel-analysis/
├── README.md
├── requirements.txt
├── data/
│   ├── users.csv
│   ├── products.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── reviews.csv
│   └── events.csv
├── sql/
│   ├── 01_base_events.sql
│   ├── 02_user_funnel.sql
│   ├── 03_funnel_metrics.sql
│   ├── 04_segment_analysis.sql
│   └── 05_time_trends.sql
└── notebooks/
    ├── 01_validation.ipynb
    └── 02_dashboard.ipynb
```

The project is intentionally structured to highlight **SQL-driven analysis first**, followed by Python-based validation and visualization.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/Shreyas-Gaikwad/ecommerce-funnel-analysis.git
cd ecommerce-funnel-analysis
```

Create a virtual environment and install dependencies:

```bash
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

---

## Usage

1. Run SQL scripts sequentially to construct funnel tables and metrics
2. Open `01_validation.ipynb` to validate SQL outputs and build explainable models
3. Open `02_dashboard.ipynb` to launch the interactive Dash dashboard

The dashboard is launched **from within the notebook itself**.

Once running, open in your browser at:

```
http://127.0.0.1:8050
```

---

## Key Learnings

* Funnel optimization requires **clear definitions and assumptions**
* SQL remains the most powerful tool for behavioral analysis
* Drop-offs often reveal product friction, not user disinterest
* Explainability matters more than raw prediction accuracy
* Dashboards are most effective when built around business questions

---

## Contributing

Contributions are welcome.

Please open issues or submit pull requests for:

* Query optimizations
* Additional segmentation ideas
* Dashboard enhancements
* Documentation improvements

---

## Author

Built by **Shreyas Gaikwad**

Focus: Data Analytics, Product Analytics, and Applied Machine Learning
