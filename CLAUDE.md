# Weave - Development Guidelines

## Project Overview

Weave is a pattern-based AI work orchestration platform that enables safe, autonomous AI-assisted technical work across any domain. Rather than prescribing specific use cases, Weave recognizes universal work patterns and adapts to any iterative technical workflow.

## Core Philosophy

**"Recognize patterns, not domains. Enable work, not categories."**

We're building an **API-first platform** that:
- Learns what you're trying to do from context
- Adapts to your tools and workflows  
- Applies appropriate safety based on detected risks
- Enables 24/7 autonomous work when trust is earned
- Works for any technical task, in any field

## System Architecture

Weave is built as a **core API platform** with multiple access methods:

```
┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│     CLI     │ │   Web UI    │ │    SDKs     │ │   Direct    │
│  (Primary)  │ │ (Monitoring)│ │  (Python,   │ │    API      │
│             │ │             │ │   JS, Go)   │ │   Access    │
└──────┬──────┘ └──────┬──────┘ └──────┬──────┘ └──────┬──────┘
       │               │               │               │
       └───────────────┴───────────────┴───────────────┘
                               │
                    ┌──────────┴──────────┐
                    │   Core API Server   │
                    │     (FastAPI)       │
                    └──────────┬──────────┘
                               │
       ┌───────────────────────┼───────────────────────┐
       │                       │                       │
┌──────┴──────┐     ┌──────────┴──────────┐  ┌────────┴────────┐
│   Pattern   │     │    Orchestration    │  │     Safety      │
│ Recognition │     │       Engine        │  │   Framework     │
└─────────────┘     └─────────────────────┘  └─────────────────┘
```

## Architecture Principles

### 1. Pattern-Based Intelligence
```python
# Bad: Domain-specific assumptions
if domain == "clinical":
    apply_hipaa_rules()
elif domain == "finance":
    apply_sox_compliance()

# Good: Context-aware detection
if context.has_sensitive_data():
    apply_privacy_protection()
if context.has_regulatory_markers():
    apply_compliance_framework()
```

### 2. Universal Operations
All technical work reduces to combinations of:
- **Load**: Get data/code from somewhere
- **Transform**: Change it in some way
- **Analyze**: Understand what it means
- **Generate**: Create something new
- **Execute**: Run processes/tools
- **Validate**: Check if it's correct
- **Iterate**: Improve based on feedback
- **Persist**: Save results

### 3. Emergent Safety
Safety rules emerge from context, not predefined categories:
```python
# Detect risk factors, apply appropriate controls
risk_factors = await detect_risks(context)
safety_controls = await generate_controls(risk_factors)
```

## Development Standards

### Code Quality
- **Type hints**: 100% coverage for public APIs
- **Testing**: Minimum 90% coverage with focus on pattern detection
- **Documentation**: Every pattern and operation must have examples
- **Async-first**: All I/O operations must be async

### Pattern Development
When implementing new patterns:
1. Define the operation sequence
2. Create detection heuristics
3. Build safety constraints
4. Add validation criteria
5. Include usage examples

Example:
```python
class RefactoringPattern(WorkPattern):
    """Pattern for code improvement without behavior change"""
    
    operations = [
        Operation.LOAD_DATA,      # Load existing code
        Operation.ANALYZE,        # Understand structure
        Operation.GENERATE,       # Create improved version
        Operation.VALIDATE,       # Ensure behavior unchanged
        Operation.PERSIST        # Save if valid
    ]
    
    async def detect(self, description: str, context: dict) -> float:
        markers = ["refactor", "clean up", "improve", "reorganize"]
        return calculate_match_score(description, markers)
```

### Testing Strategy

#### Pattern Detection Tests
```python
async def test_pattern_detection():
    # Test with various phrasings
    tasks = [
        "refactor this messy function",
        "clean up the code structure", 
        "improve readability without changing behavior"
    ]
    
    for task in tasks:
        pattern = await detector.detect(task)
        assert isinstance(pattern, RefactoringPattern)
```

#### Safety Derivation Tests
```python
async def test_safety_emergence():
    # Context with sensitive data
    context = {"files": ["users.db", "passwords.txt"]}
    constraints = await safety.derive_constraints(context)
    
    assert constraints.has_privacy_protection()
    assert constraints.requires_encryption()
```

## Key Features Implementation

### 24-Hour Autonomous Work
```python
class AutonomousWorker:
    """Enable round-the-clock productivity"""
    
    async def work_while_away(self, tasks: List[Task]):
        for task in tasks:
            # Check trust level for pattern
            pattern = await self.detect_pattern(task)
            trust = await self.calculate_trust(pattern)
            
            if trust > task.required_trust:
                # Execute autonomously
                await self.execute(task)
            else:
                # Queue for human review
                await self.queue_for_review(task)
```

### YOLO Mode (Safe Experimentation)
```python
class YOLOMode:
    """Explore freely within safety bounds"""
    
    async def activate(self, context: WorkContext):
        # Relax non-critical constraints
        relaxed = self.relax_constraints(context)
        
        # But maintain critical safety
        critical = self.maintain_critical_safety(context)
        
        return YOLOSession(
            relaxed_constraints=relaxed,
            critical_safety=critical,
            time_limit=timedelta(hours=2)
        )
```

### Pattern Learning
```python
class PatternLearner:
    """System improves through usage"""
    
    async def learn_from_execution(self, execution: Execution):
        if execution.successful:
            # Extract pattern features
            features = await self.extract_features(execution)
            
            # Update pattern model
            await self.update_model(execution.pattern, features)
            
            # Discover new patterns
            if new_pattern := await self.detect_new_pattern(features):
                await self.register_pattern(new_pattern)
```

## API Design Guidelines

### Natural Language First
```python
# Primary interface is natural language
@app.post("/execute")
async def execute_task(request: TaskRequest):
    # Understand intent
    context = await analyzer.analyze(request.description)
    
    # Detect patterns
    patterns = await detector.detect_patterns(context)
    
    # Execute with appropriate pattern
    result = await executor.execute(request.description, patterns[0])
    
    return result
```

### Pattern Hints (Optional)
```python
# Users can hint at patterns for faster execution
@app.post("/execute/{pattern}")
async def execute_with_pattern(
    pattern: str,
    request: TaskRequest
):
    # Use specified pattern
    pattern_impl = registry.get_pattern(pattern)
    return await executor.execute(request.description, pattern_impl)
```

## Security Principles

### Zero Trust Architecture
- Every execution in isolated container
- No persistent credentials
- Minimal container capabilities
- Network isolation by default

### Adaptive Security
```python
class AdaptiveSecurity:
    """Security that matches risk level"""
    
    async def apply_controls(self, context: WorkContext):
        risk_level = await self.assess_risk(context)
        
        if risk_level == RiskLevel.CRITICAL:
            # Maximum isolation, audit everything
            return MaximalSecurityProfile()
        elif risk_level == RiskLevel.STANDARD:
            # Standard controls
            return StandardSecurityProfile()
        else:
            # Basic controls for low-risk work
            return MinimalSecurityProfile()
```

## Monitoring and Observability

### Pattern Metrics
```python
# Track pattern usage and success
pattern_usage = Counter(
    'pattern_executions_total',
    'Total executions by pattern',
    ['pattern_name', 'success']
)

pattern_latency = Histogram(
    'pattern_execution_duration_seconds',
    'Execution time by pattern',
    ['pattern_name']
)
```

### Learning Metrics
```python
# Track system improvement
patterns_discovered = Counter(
    'patterns_discovered_total',
    'New patterns discovered'
)

trust_evolution = Gauge(
    'pattern_trust_score',
    'Current trust score by pattern',
    ['pattern_name']
)
```

## Getting Started

### Development Setup
```bash
# Clone repository
git clone https://github.com/shandley/weave.git
cd weave

# Setup environment
python -m venv venv
source venv/bin/activate
pip install -e ".[dev]"

# Run tests
pytest

# Start development server
uvicorn src.main:app --reload
```

### First Contribution
1. Pick a pattern to implement from `src/patterns/todo.md`
2. Write detection logic
3. Define operation sequence
4. Add safety constraints
5. Create tests
6. Submit PR

### Testing Your Pattern
```python
# Quick pattern test
async def test_my_pattern():
    task = "your example task description"
    
    # Test detection
    pattern = await detector.detect(task)
    print(f"Detected: {pattern}")
    
    # Test execution
    result = await executor.execute(task, pattern)
    print(f"Result: {result}")
```

## Design Decisions

### Why Patterns Over Domains?
- **Flexibility**: New use cases work immediately
- **Learning**: System improves with usage
- **Simplicity**: One mental model for all work
- **Power**: Patterns compose naturally

### Why Container Isolation?
- **Safety**: Complete control over execution
- **Flexibility**: Any tool/language works
- **Reproducibility**: Exact environment capture
- **Rollback**: Easy checkpoint/restore

### Why Trust-Based Autonomy?
- **Progressive**: Earn trust through success
- **Contextual**: Trust varies by risk level
- **Transparent**: Clear trust requirements
- **Safe**: Always bounded by constraints

## Common Patterns

### Exploratory Pattern
"Try different approaches to solve a problem"
- Operations: Generate variants → Test each → Compare results
- Trust: Builds through successful explorations
- Safety: Limit resource usage per variant

### Pipeline Pattern  
"Process data through sequential steps"
- Operations: Load → Transform → Validate → Save
- Trust: High for established pipelines
- Safety: Checkpoint between steps

### Analytical Pattern
"Understand data or code"
- Operations: Load → Analyze → Visualize → Report
- Trust: Generally high (read-only)
- Safety: Protect sensitive data

### Generative Pattern
"Create new artifacts"
- Operations: Generate → Validate → Iterate → Finalize
- Trust: Depends on validation success
- Safety: Limit scope of changes

## Future Vision

### Near Term (3 months)
- 50+ built-in patterns
- Pattern marketplace
- Visual workflow builder
- Team collaboration

### Medium Term (6 months)
- Pattern composition
- Cross-pattern learning
- Predictive planning
- Custom constraints

### Long Term (12 months)
- Industry pattern packs
- Regulatory compliance patterns
- Pattern optimization AI
- Standard for AI work orchestration

## Contributing

We welcome contributions that:
- Add new patterns
- Improve pattern detection
- Enhance safety mechanisms
- Expand tool support
- Improve documentation

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Remember

This platform is about **enabling human potential** through AI assistance. Every feature should:
- Make work easier
- Increase safety
- Build appropriate trust
- Learn from usage
- Stay flexible

The goal is not to categorize work, but to understand and enable it.