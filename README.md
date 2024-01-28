# Multi-Agent Coordination Project

## Description
The project domain concerns a multi-agent based support system for organizing holidays for different tour operators, services companies and consumers.

Submission deadline : 25/01/2024, 23:59

See https://ci.mines-stetienne.fr/cps2/mac/project-subject.html for more details.

## Getting started

- **Run project:**  Go to `holiday` then run `./holiday/gradlew`:

```bash
cd holiday
./gradlew run
```

## Agent Overview :
The project domain concerns a multi-agent based support system for organizing holidays for different tour operators, services companies and consumers.

### 1. Three types of agents:
- **Tour Operator agent (toa)** acts on behalf of a tour operator agency. **toa** has a portfolio of several predefined holiday packages (itinerary and content) that it sells to consumers. A **toa** contracts with services companies to deliver the services offered in the holiday packages.
- **Consumer agent (ca)** acts on behalf of a consumer according to the consumers' preferences for booking a holiday package with a tour operator.
- **Services company agent (sca)** acts on behalf of a services company. Each company is specialized in offering different services for holidays (e.g., accommodation, transport, guides, tours, etc.) in different places (e.g., Istanbul, Athens, Rome, Paris, London, Malta, Buenos Aires, Rio de Janeiro, Maldives, etc.).

### 2. One organization:
- A **holiday package (hp)** consists of:
    - a plan of **`services`** that provides an activity (accommodation, transport, guide, tour, etc., operated by a services company). 
    - in a given **`place`**.
- Holiday packages are **described** so that consumers may select the tour operator from whom to buy the holiday package. 
- Once bought by a consumer from a tour operator, a holiday package is **executed** by the contracted services companies in the order defined in the holiday package.

## Execution Phases : 
To prepare for the holiday season, three phases are executed:

#### 1. Contracting phase : toas contract services needed for their holiday packages: toas negotiate with scas that offer the services at places that are part of their offered holiday packages.
- (to simplify we can consider **one holiday package per toa**, but in principle a toa could handle several holiday packages)
- A toa may choose the best offer according to its **budget, preferences or any other criteria (e.g., sca's reputation)**, since there could be several scas offering the same service for the same place.
- Scas may choose the best offer according to their **profit**, since there could be several toas looking for the same service,
- To reduce the number of exchanged messages, a toa only negotiates with the scas that offer the **right service at the right place**.

#### 2. Purchasing phase : Each ca buys one holiday package offered by the toas.

- The ca chooses the best offer according to its **budget, preferences or any other criteria (e.g., toa's reputation)**, since there could be several toas selling the same holiday package, 

#### 3. Delivering phase : scas deliver the contracted services.

- The contracted scas are coordinated according to the contracted services and places as they appear in the holiday package.

- The execution of a holiday package is supervised by the toa and involves the ca (i.e., when service starts (resp. ends) at a place, the ca receives an event or a message).


## Todo List

1.  Agent Implmentation
- [ ] **CA**:
    - [x] **External Description of a CA:**: TOAPreferences = [Budget, Place, TOAMinReputation]
- [ ] **TOA**:
    - [x] **External Description of a TOA:**: Reputation, Name, SCAPreferences = [Service, Budget, SCAMinReputation]
- [ ] **SCA**:
    - **External Description of an SCA:** Reputation (Grade/5), Name, Task, Package = [TBD,TBD,Price]
    - [x] Make the SCA according to services
        - [x] Make **Restauration SCA**
            - **External Desc:** Reputation, Name, Task, Package = [Place, RestaurantName, Price]
        - [x] Make **Transport SCA**
            - **External Desc:** Reputation, Name, Task, Package = [Origin, Destination, Price]
        - [x] Make **Tour SCA**
            - **External Desc:** Reputation, Name, Task, Package = [Place, MonumentName, Price]
        - [x] Make **Accomodation SCA**
            - **External Desc:** Reputation, Name, Task, Package = [Place, HotelName, Price]
    - [ ] Contract phase of SCA 

**Service List:** Accomodation, Restauration, Tour, Transport  
**Cities List:** Paris, Saint-Étienne, Tokyo, New York, Lagos, New Delhi, Rio, Bangkok, Athens, Moscow, Berlin, 

2. Organization
- [ ] The **holiday package** is expressed as an organization that is used to coordinate the contracted **sca**s in the delivering phase execution of services participating to the holiday package.
- [ ] Since there could be several holiday packages, you will develop a library of organizations. You will define some abstract description of each holiday package so that the ca may select the suited **toa**.

3. Interaction
- [ ] The contracting phase and purchasing phase may be realized using **auction artifacts** that implement auction protocols in artifacts.
- [ ] You can use one of the protocols introduced in FIPA (http://www.fipa.org/repository/ips.php3). To manage the concurrency of the bidding (one to m participants) it may be easier to use artifacts to implement such protocols.
- [ ] Negotiation protocols may be used to manage the interaction between a ca and a **toa** about the cost for booking a holiday package.

4. Environment
- [ ] Each pair `(service, place)` - accommodation, transport, guide, tours, etc. at one place - is implemented by an artifact that can be used exclusively by one consumer (exclusive access to the service, place).
- [ ] The `(service, place)` artifacts share information about their availability. A ca may access to a service only if it is known as accessible.
- [ ] For that purpose, the `(service, place)` artifact has only one action (execute) that is deactivated for a period (to be fixed).

## Authors
Minh-Hoang HUYNH, Utibeabasi DAN, Shreyas HARINATH, Ninon LAHIANI.
