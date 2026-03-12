# 📊 RIT IPR Project Workflow - Mermaid Diagrams

## 🎯 Complete System Flow

```mermaid
flowchart TD
    A[👤 User Visits RIT IPR System] --> B{🔐 Authenticated?}
    
    B -->|No| C[📝 Register/Login Page]
    C --> D[🔑 Create Account]
    C --> E[🚪 Login with Credentials]
    D --> F[💾 Store User in Database]
    E --> G[🎫 Generate JWT Token]
    F --> G
    G --> H[📊 Dashboard]
    
    B -->|Yes| H
    
    H --> I[🆕 Create New Patent Application]
    H --> J[📚 View Patent History]
    H --> K[👤 Account Management]
    
    I --> L[📋 Patent Application Form]
    L --> M{📄 Upload Document?}
    
    M -->|Yes| N[📤 File Upload]
    N --> O{📁 File Type?}
    O -->|PDF| P[📖 PDF Text Extraction]
    O -->|DOC/DOCX| Q[📝 Word Document Processing]
    O -->|Image| R[🔍 OCR Processing with Tesseract]
    
    P --> S[🤖 Smart Auto-Fill Fields]
    Q --> S
    R --> S
    
    M -->|No| T[✍️ Manual Form Entry]
    S --> U[📝 Review & Edit Information]
    T --> U
    
    U --> V[🔍 AI Analysis with Gemini]
    V --> W[🧠 Generate Innovation Score]
    V --> X[🆕 Generate Novelty Score]
    V --> Y[⚡ Generate Readiness Score]
    V --> Z[📈 Calculate Grant Probability]
    
    W --> AA[📊 Display Analysis Results]
    X --> AA
    Y --> AA
    Z --> AA
    
    AA --> BB{✅ Satisfied with Results?}
    BB -->|No| U
    BB -->|Yes| CC[📋 Select Required Forms]
    
    CC --> DD[📄 Generate Patent Documents]
    DD --> EE[📑 Form 1: Application for Grant]
    DD --> FF[📄 Form 2: Complete Specification]
    DD --> GG[📝 Form 3: Statement & Undertaking]
    DD --> HH[✍️ Form 5: Declaration of Inventorship]
    DD --> II[🤝 Form 26: Patent Agent Authorization]
    DD --> JJ[🏛️ NOC-I: Institutional NOC]
    DD --> KK[🎓 NOC-S: Student/Author NOC]
    
    EE --> LL[📥 Download PDF Bundle]
    FF --> LL
    GG --> LL
    HH --> LL
    II --> LL
    JJ --> LL
    KK --> LL
    
    LL --> MM[💾 Save to Patent History]
    MM --> NN[🎉 Patent Application Complete]
    
    J --> OO[📜 View Previous Applications]
    OO --> PP[📊 View Analysis Details]
    OO --> QQ[📥 Re-download Documents]
    
    K --> RR[✏️ Update Profile]
    K --> SS[🚪 Logout]
```

---

## 🏗️ System Architecture Flow

```mermaid
flowchart LR
    subgraph "🌐 Frontend (React + Vite)"
        A[🎨 User Interface]
        B[📱 React Components]
        C[🔄 State Management]
        D[📡 API Calls]
    end
    
    subgraph "🚀 Backend (Node.js + Express)"
        E[🛣️ API Routes]
        F[🔐 Authentication]
        G[🗄️ Database Operations]
        H[🤖 AI Integration]
    end
    
    subgraph "🗃️ Data Storage"
        I[📊 SQLite Database]
        J[👥 Users Table]
        K[📋 Patents Table]
    end
    
    subgraph "🤖 External Services"
        L[🧠 Google Gemini AI]
        M[🔍 Tesseract OCR]
        N[📄 PDF.js Processing]
    end
    
    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> I
    I --> J
    I --> K
    E --> H
    H --> L
    D --> M
    D --> N
```

---

## 🔄 Document Processing Pipeline

```mermaid
flowchart TD
    A[📤 User Uploads Document] --> B{📁 Detect File Type}
    
    B -->|PDF| C[📖 PDF.js Library]
    B -->|DOC/DOCX| D[📝 Mammoth.js Library]
    B -->|Image| E[🔍 Tesseract.js OCR]
    
    C --> F[📄 Extract Text Content]
    D --> F
    E --> G[🖼️ Image Recognition]
    G --> F
    
    F --> H[🧹 Clean & Process Text]
    H --> I[🔍 Pattern Recognition]
    
    I --> J[🎯 Extract Title]
    I --> K[❓ Extract Problem Statement]
    I --> L[🔧 Extract Components]
    I --> M[⚙️ Extract Working Method]
    I --> N[✨ Extract Unique Features]
    I --> O[🏭 Detect Industry Category]
    
    J --> P[📝 Auto-Fill Form Fields]
    K --> P
    L --> P
    M --> P
    N --> P
    O --> P
    
    P --> Q[👀 User Review & Edit]
    Q --> R[✅ Proceed to AI Analysis]
```

---

## 🤖 AI Analysis Workflow

```mermaid
flowchart TD
    A[📝 Patent Information Input] --> B[🔑 Get Gemini API Key]
    B --> C[📋 Prepare Analysis Prompt]
    
    C --> D[🧠 Send to Google Gemini AI]
    D --> E{📡 API Response OK?}
    
    E -->|No| F[🔄 Retry with Different Key]
    F --> D
    E -->|Yes| G[📊 Parse JSON Response]
    
    G --> H[💡 Innovation Score 0-100]
    G --> I[🆕 Novelty Score 0-100]
    G --> J[⚡ Technical Readiness 0-100]
    G --> K[📈 Grant Probability 0-100]
    G --> L[📝 Detailed Analysis]
    G --> M[💡 Improvement Suggestions]
    
    H --> N[🎨 Generate Visual Charts]
    I --> N
    J --> N
    K --> N
    
    N --> O[📊 Display Results Dashboard]
    L --> O
    M --> O
    
    O --> P{✅ User Satisfied?}
    P -->|No| Q[✏️ Edit Information]
    Q --> A
    P -->|Yes| R[📋 Proceed to Form Generation]
```

---

## 📄 Form Generation Process

```mermaid
flowchart TD
    A[✅ Analysis Complete] --> B[📋 Select Required Forms]
    
    B --> C{📄 Form Selection}
    
    C --> D[📑 Form 1: Application for Grant]
    C --> E[📄 Form 2: Complete Specification]
    C --> F[📝 Form 3: Statement & Undertaking]
    C --> G[✍️ Form 5: Declaration of Inventorship]
    C --> H[🤝 Form 26: Patent Agent Authorization]
    C --> I[🏛️ NOC-I: Institutional NOC]
    C --> J[🎓 NOC-S: Student/Author NOC]
    
    D --> K[📝 Fill Form Template]
    E --> L[📄 Generate Specification]
    F --> M[📋 Create Statement]
    G --> N[✍️ Inventor Declaration]
    H --> O[🤝 Agent Authorization]
    I --> P[🏛️ Institution NOC]
    J --> Q[🎓 Student NOC]
    
    K --> R[📑 Generate PDF]
    L --> S[📄 Generate PDF]
    M --> T[📋 Generate PDF]
    N --> U[✍️ Generate PDF]
    O --> V[🤝 Generate PDF]
    P --> W[🏛️ Generate PDF]
    Q --> X[🎓 Generate PDF]
    
    R --> Y[📦 Bundle All PDFs]
    S --> Y
    T --> Y
    U --> Y
    V --> Y
    W --> Y
    X --> Y
    
    Y --> Z[📥 Download ZIP Package]
    Z --> AA[💾 Save to Database]
    AA --> BB[🎉 Process Complete]
```

---

## 🔐 Authentication & Security Flow

```mermaid
flowchart TD
    A[👤 User Action] --> B{🔐 Requires Auth?}
    
    B -->|No| C[🌐 Public Access]
    B -->|Yes| D{🎫 Has Valid Token?}
    
    D -->|No| E[🚪 Redirect to Login]
    E --> F[📝 Enter Credentials]
    F --> G[🔍 Validate Credentials]
    
    G --> H{✅ Valid?}
    H -->|No| I[❌ Show Error]
    I --> F
    H -->|Yes| J[🎫 Generate JWT Token]
    
    J --> K[💾 Store Token in LocalStorage]
    K --> L[🔓 Grant Access]
    
    D -->|Yes| M[🔍 Verify Token]
    M --> N{⏰ Token Valid?}
    N -->|No| O[🗑️ Clear Token]
    O --> E
    N -->|Yes| L
    
    L --> P[🎯 Execute Protected Action]
    P --> Q[📊 Return Response]
```

---

## 💾 Database Operations Flow

```mermaid
flowchart TD
    A[📡 API Request] --> B{🔐 Authenticated?}
    B -->|No| C[❌ 401 Unauthorized]
    B -->|Yes| D{📋 Operation Type?}
    
    D -->|CREATE| E[➕ Insert New Record]
    D -->|READ| F[🔍 Query Records]
    D -->|UPDATE| G[✏️ Modify Record]
    D -->|DELETE| H[🗑️ Remove Record]
    
    E --> I[👥 Users Table]
    E --> J[📋 Patents Table]
    
    F --> K[🔍 Filter by User ID]
    K --> L[📊 Return Results]
    
    G --> M[✅ Verify Ownership]
    M --> N{👤 User Owns Record?}
    N -->|No| O[❌ 403 Forbidden]
    N -->|Yes| P[✏️ Update Record]
    
    H --> Q[✅ Verify Ownership]
    Q --> R{👤 User Owns Record?}
    R -->|No| S[❌ 403 Forbidden]
    R -->|Yes| T[🗑️ Delete Record]
    
    I --> U[💾 SQLite Database]
    J --> U
    L --> V[📤 JSON Response]
    P --> V
    T --> V
```

---

## 🚀 Deployment Architecture

```mermaid
flowchart TD
    subgraph "👨‍💻 Development"
        A[💻 Local Development]
        B[🔧 Build Process]
        C[📤 Git Push]
    end
    
    subgraph "🌐 GitHub"
        D[📚 Repository]
        E[🔄 Auto-Deploy Trigger]
    end
    
    subgraph "🚂 Railway/Render"
        F[📦 Build Frontend]
        G[📦 Install Backend Deps]
        H[🚀 Start Node.js Server]
        I[🌍 Live Application]
    end
    
    subgraph "👥 Users"
        J[🌐 Web Browser]
        K[📱 Mobile Browser]
    end
    
    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
    H --> I
    I --> J
    I --> K
    
    I --> L[📊 Serve Frontend]
    I --> M[🔌 Handle API Requests]
    I --> N[💾 Database Operations]
    I --> O[🤖 AI Processing]
```

This comprehensive flowchart shows the complete workflow of your RIT IPR patent filing system, from user authentication through document processing, AI analysis, and form generation to final deployment architecture.