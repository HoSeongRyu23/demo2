---
marp: true
theme: gaia
class: lead
backgroundColor: #fff
paginate: true
_paginate: false
style: |
  section {
    font-family: 'Malgun Gothic', 'Apple SD Gothic Neo', sans-serif;
  }
  h1 {
    color: #003366;
  }
  h2 {
    color: #00509E;
  }
  strong {
    color: #E67E22;
  }
---

# SAP FCM 트레이닝 샌드박스
## (Learning-ERP)

### 리스크 없는 SAP FI/CO 실습 시뮬레이터

---

## 1. 프로젝트 개요 (Project Overview)

**목표**
- 리스크 없는 SAP FI/CO 실습 시뮬레이터.
- **"실패를 통해 안전하게 배우자."**

**타겟 사용자**
- SAP 입문자, 주니어 컨설턴트.

**핵심 가치**
- **데이터 흐름(Data Flow) 시각화** & **오류 원인 이해**.

---

## 2. 왜 필요한가? (핵심 차별점)

| 특징 | 설명 | 기대 효과 |
| :--- | :--- | :--- |
| **Zero Risk** | 격리된 샌드박스 환경 | 데이터 오염 걱정 없이 테스트 (생성/삭제 자유). |
| **가시화 (Visualization)** | 프로세스 흐름도 제공 | End-to-End 흐름 이해 (SD -> FI -> CO). |
| **자동 피드백** | 에러 가이드 | "왜 틀렸는지" 즉시 확인 및 자기 주도 학습. |

---

## 3. 핵심 기능 - 시나리오 미션

**시나리오 A: SD-FI 통합 (매출)**
- **미션**: 비비고 만두 1,000박스 판매.
- **Flow**: 판매오더(SO) -> 출고(GI) -> 대금청구(Billing) -> **회계전표(FI Doc)**.
- **학습**: 물류(Logistics)와 재무(Finance)의 연결 이해.

**시나리오 B: 기말 결산 (배부)**
- **미션**: 제조 간접비 배부 수행.
- **Flow**: 비용 발생 -> **배부 사이클(Allocation Cycle)** -> 코스트 센터.
- **학습**: 코스트 센터 및 배부 로직 이해.

---

## 3. 핵심 기능 - 분석 및 오류 시뮬레이션

**CO-PA 분석 (수익성 분석)**
- 실시간 **수익성 대시보드** (제품별/고객별 손익).
- 내 입력이 최종 **경영 지표(Bottom Line)** 에 미치는 영향 확인.

**오류 시뮬레이터 (Error Simulator)**
- **의도된 오류** 상황 경험.
- 예시: "차대변 불일치", "마감된 회계 기간", "유효하지 않은 코스트 센터".
- **문제 해결(Troubleshooting)** 능력 배양.

---

## 4. 기술 스택 (Tech Stack)

**Frontend**
- **React.js / Next.js**
- SAP Fiori 디자인 가이드라인 준수 (모던 & 직관적).
- React Flow를 활용한 프로세스 시각화.

**Backend**
- **Node.js** 또는 **Python**
- 비즈니스 로직: 유효성 검증, 배부 엔진 구현.

**Database**
- **PostgreSQL**
- 단순화된 SAP 스키마 (Tables: BKPF, BSEG, CE1xxxx 등).

---

## 5. 데이터 모델링 (Simplified)

복잡함은 덜어내고 핵심 구조만 학습.

*   **BKPF**: 전표 헤더 (회사코드, 전기일).
*   **BSEG**: 전표 상세 (G/L계정, 금액, 코스트센터).
*   **CE1xxxx**: 경영 단위 (수익성 분석 세그먼트).
*   **T001 / CSKS**: 마스터 데이터 (회사, 코스트 센터).

---

## 6. 향후 계획

*   **ABAP 로직 뷰어**: 백엔드 로직을 ABAP Pseudo Code로 보여주는 기능.
*   **다국어 지원**: 글로벌 프로젝트 환경 시뮬레이션.

---

# 감사합니다

**Q & A**
